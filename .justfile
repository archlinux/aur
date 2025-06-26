#
# just
#
# Command runner for project-specific tasks.
# <https://github.com/casey/just>
#

gh := require("gh")
jq := require("jq")
vercmp := require("vercmp")
makepkg := require("makepkg")

tag := `
  gh release list --repo MystenLabs/sui --exclude-pre-releases --exclude-drafts --json tagName | \
  jq -re --arg network 'testnet' '.[] | .tagName | select(. | startswith($network))' | \
  head -1
  `

bump:
  #!/bin/sh
  set -e

  current="$(grep 'pkgver=' PKGBUILD | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')"
  echo "Current version: $current"

  latest="$(echo '{{tag}}' | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')"

  if [ "$(vercmp "$current" "$latest")" -ne "-1" ]; then
    echo "No version bump needed"
    exit
  fi

  echo "Bumping version to $latest"
  sed -i "s/pkgver=.*/pkgver=$latest/" PKGBUILD

  echo "Updating checksums"
  checksums="$(makepkg -g)"
  for arch in $(sed -nE 's/arch=\((.*)\)/\1/p' PKGBUILD); do
    arch="$(echo $arch | sed -E 's/"(.*)"/\1/g')"
    sed -i "s/sha256sums_$arch=.*/$(echo "$checksums" | grep "sha256sums_$arch")/" PKGBUILD
  done

  echo "Updating SRCINFO"
  makepkg --printsrcinfo > .SRCINFO

  git commit -am "feat: sui-$tag"
