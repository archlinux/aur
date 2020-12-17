# Maintainer: Max Gautier <mg+archlinux@max.gautier.name>
# Maintainer: Ema Panz <thepanz+aur at gmail dot com>
# Contributor: Jeff Henson <jeff@henson.io>

# When updating: make sure to select the proper github's commit hash and update the sha256sum of the ZIP file
githubCommitHash=02c110006bfef4ba53fa5042bb9eae170dd3dc1c

pkgname=origin-client
pkgdesc="Openshift client"
pkgver=4.6.r20201212.02c1100
pkgrel=1
arch=('x86_64')
url="https://github.com/openshift/oc"
license=('Apache')
makedepends=('go-pie' 'jq')

# We rely on a commit's hash to download sources, as the maintainers of the OriginClient do not provide tagged releases
# additionally we use the github APIs we fetch the commit details, to properly build the package version
# Note: the tags used on the openshiftr repository have all timestamps informations in it, *not* helpful
source=(
    "https://github.com/openshift/oc/archive/${githubCommitHash}.zip"
    "https://api.github.com/repos/openshift/oc/git/commits/${githubCommitHash}"
)
sha256sums=(
    '5b82e94b62a2e23c8a6884e1f8c31b8af75fb0dd8853b330d09c46cc0fcc9efe'
    'SKIP'
)

build() {
  cd "oc-${githubCommitHash}"

  # We set the version in the OC executable
  export SOURCE_GIT_TAG="${pkgver}"

  make
}

pkgver() {
  local commitDate=$(jq -r '.author.date' ${githubCommitHash} | xargs -I {} date --date="{}" "+%Y%m%d")

  echo "4.6.r${commitDate}.${githubCommitHash:0:7}"
}

#check() { # Checks are broken right now
#  cd "oc-release-$pkgver"
#  make verify test
#}

package() {
  cd "oc-${githubCommitHash}"

  install -Dm755 oc -t "$pkgdir/usr/bin"
  install -dm 755 "$pkgdir/usr/share/man/man1"
  ./genman "$pkgdir/usr/share/man/man1" oc
  install -Dm644 contrib/completions/bash/oc "$pkgdir/usr/share/bash-completion/completions/oc"
  install -Dm644 contrib/completions/zsh/oc "$pkgdir/usr/share/zsh/site-functions/_oc"
}
