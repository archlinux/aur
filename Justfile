filesList := "default.cfg duckdns.service duckdns.timer duckdns.sh"

default:
  @just --list --justfile {{ justfile() }}

# Builds and checks PKGBUILD file with the new sources and computed hashes
assemble:
    # remove old parts from the PKGBUILD file
    sed -i -z -e 's|sha512sums=(.*\n*)\n||' -e 's|source=(.*)\n||' PKGBUILD
    # Generate the new sources and their hashes
    just --justfile {{ justfile() }} generateParts >> PKGBUILD


# build the .SRCINFO file after assembling the sources and hashes
updateSrcinfo: assemble
    makepkg --printsrcinfo > .SRCINFO

build:
    # Build the new package, cleaning the additional folders
    makepkg --clean

# Generate source and hashes parts for the PKGBUILD file
generateParts: (source filesList) (hashes filesList)

[private]
source +files:
    @echo -n 'source=('
    @for i in {{ files }} ; do echo -n "'$i' "; done;
    @echo ')'

[private]
hashes +files:
    @echo 'sha512sums=('
    @for i in {{ files }} ; do sha512sum $i | cut --fields=1 --delimiter=" " | sed -e 's|.*|    "&"|' ; done;
    @echo ')'
