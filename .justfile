jq := require("jq")
vercmp := require("vercmp")
makepkg := require("makepkg")
nvchecker := require("nvchecker")

latest_version := `nvchecker -c .nvchecker.toml --logger json | jq -r 'select(.version != null) | .version'`

print-latest:
  @echo "Latest version is {{latest_version}}"

bump:
  #!/bin/sh
  set -eu

  current="$(bash -c 'source ./PKGBUILD; printf "%s" "$pkgver"')"
  latest="{{latest_version}}"
  test -n "$latest"
  echo "Current version: $current"
  echo "Latest version: $latest"

  if [ "$(vercmp "$current" "$latest")" -ge 0 ]; then
    echo "No version bump needed"
    exit
  fi

  sed -i "s/^pkgver=.*/pkgver=$latest/; s/^pkgrel=.*/pkgrel=1/" PKGBUILD
  just update-checksums

update-checksums:
  updpkgsums
  makepkg --printsrcinfo > .SRCINFO

build:
  makepkg -f

check:
  bash -n PKGBUILD
  namcap PKGBUILD
  makepkg --verifysource -f
  makepkg --printsrcinfo | diff -u .SRCINFO -

install:
  makepkg -fsi

clean:
  rm -rf -- crit-*-LICENSE crit-*-README.md crit-*-linux-* *.pkg.tar.* ./src ./pkg
