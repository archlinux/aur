#
# just
#
# Command runner for project-specific tasks.
# <https://github.com/casey/just>
#

jq := require("jq")
vercmp := require("vercmp")
makepkg := require("makepkg")
nvchecker := require("nvchecker")

bump:
  #!/bin/sh
  set -e

  current="$(grep 'pkgver=' PKGBUILD | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')"
  echo "Current version: $current"

  latest="$(nvchecker -c .nvchecker.toml --logger json | jq -r '.version')"
  echo "Latest version: $latest"

  if [ "$(vercmp "$current" "$latest")" -ne "-1" ]; then
    echo "No version bump needed"
    exit
  fi

  echo "Bumping version to $latest"
  sed -i "s/pkgver=.*/pkgver=$latest/" PKGBUILD
  sed -i "s/pkgrel=.*/pkgrel=1/" PKGBUILD

  just update-checksums
  just commit

update-checksums:
  #!/bin/sh
  set -e

  echo "Updating checksums"
  checksums="$(makepkg -g)"
  for arch in $(sed -nE 's/arch=\((.*)\)/\1/p' PKGBUILD); do
    arch="$(echo $arch | sed -E 's/"(.*)"/\1/g')"
    sed -i "s/sha256sums_$arch=.*/$(echo "$checksums" | grep "sha256sums_$arch")/" PKGBUILD
  done

  echo "Updating SRCINFO"
  makepkg --printsrcinfo > .SRCINFO

commit:
  #!/bin/sh
  set -e

  msg="$(nvchecker -c .nvchecker.toml --logger json | jq -r '.name + " " + .version')"
  git commit -am "chore: $msg"

install:
  makepkg -si

clean:
  rm -rf *.tgz *.zst ./src ./pkg
