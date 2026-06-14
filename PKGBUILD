# Maintainer: Wabuo <Spam [.] Wabuo [at] GoogleMail [.] Com>

pkgname=betterleaks
pkgver=VERSION # This will be automatically updated by makepkg via pkgver()
pkgrel=2
pkgdesc="Go-based secret scanner offering CEL rule evaluation and Gitleaks compatibility"
arch=('x86_64' 'aarch64')
url="https://github.com/betterleaks/betterleaks"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'jq')
# Pull the repository head directly so pkgver() can run against the latest state
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  local owner="betterleaks"
  local repo="betterleaks"
  local latest_tag

  # Filters for the first entry where "prerelease" is false and "draft" is false
  latest_tag=$(curl -s "https://api.github.com/repos/${owner}/${repo}/releases" | \
    jq -r 'map(select(.prerelease == false and .draft == false)) | .[0].tag_name' 2>/dev/null)

  if [[ -n "$latest_tag" && "$latest_tag" != "null" ]]; then
    # Strip leading 'v' if present to follow Arch versioning guidelines
    latest_tag="${latest_tag#v}"
    # Clean the version number for PKGBUILD standard (replaces hyphens with underscores)
    printf "%s" "${latest_tag//-/_}"
  else
    # Fail loud and hard if the API call fails or returns nothing
    echo "Error: Could not fetch the latest stable release tag from GitHub API." >&2
    echo "FATAL: Something went horribly wrong!"
    exit 1
  fi
}

#prepare() {
#  cd "$pkgname"
#
#  # Checkout the exact tag we just discovered in pkgver()
#  # We re-prepend 'v' here since the actual git tags on GitHub use the 'v' prefix
#  git checkout "v$pkgver"
#
#  export GOPATH="${srcdir}/gopath"
#  go mod download
#}

build() {
  cd "$pkgname"

# --------- This should be in prepare() but prepare runns before pkgver so it wont work -------
  # Checkout the exact tag we just discovered in pkgver()
  # We re-prepend 'v' here since the actual git tags on GitHub use the 'v' prefix
  git checkout "v$pkgver"
echo "after git checkout"
# --------------------

make build
}

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  # install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
