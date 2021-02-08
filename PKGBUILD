# Maintainer: Sven Greb <development@svengreb.de>
# Contributor: Arctic Ice Studio <development@arcticicestudio.com>
#
# This package is built according to the AUR Go packaging guidelines:
# https://wiki.archlinux.org/index.php/Go_package_guidelines
pkgname=mage
pkgver=1.10.0
pkgrel=1
pkgdesc="A Make/rake-like build tool using Go"
arch=("x86_64")
url="https://magefile.org"
license=("Apache")
makedepends=("git" "go-pie")
source=("git+https://github.com/magefile/${pkgname}.git")
sha256sums=("SKIP")

build() {
  cd "$pkgname"

  # We're building from source to get metadata information for the binary, but using a stable version tag instead of
  # the latest commit since this is not a `-git` package.
  git checkout "v$pkgver"

  # mage is build with mage itself, therefore we simluate the execution of the provided `bootstrap.go` installation
  # file that is recommended by the author.
  # The file builds mage when mage itself is not installed on the target system yet and included metadata information
  # for the binary.
  # See:
  #   - https://github.com/magefile/mage/blob/5bc3a8ab/magefile.go#L55
  #   - https://github.com/magefile/mage/blob/5bc3a8ab/magefile.go#L95
  #   - https://github.com/magefile/mage/blob/5bc3a8ab/.goreleaser.yml#L29
  local build_date git_commit_hash git_tag
  build_date=$(command date --rfc-3339=seconds)
  git_commit_hash=$(git rev-parse --short HEAD)
  git_tag=$(git describe --tags)
  if [ -z "$git_tag" ]; then
    git_tag="dev"
  fi

  export CGO_ENABLED=0
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X \"github.com/magefile/mage/mage.timestamp=$build_date\" \
              -X \"github.com/magefile/mage/mage.commitHash=$git_commit_hash\" \
              -X \"github.com/magefile/mage/mage.gitTag=$git_tag\" \
              -extldflags \"${LDFLAGS}\"" \
    -o build/"$pkgname" .
}

package() {
  cd "$pkgname" || exit 1
  install -Dm755 build/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
