# Please report maintenance problems to the project GitHub issue tracker
#   i.e. https://github.com/Student-Team-Projects/email-client/issues

# Published to the AUR by .github/workflows/aur-release.yml on every push to the
# `main` branch. pkgver and sha256sums are filled in by the workflow (pkgver
# comes from project(VERSION) in CMakeLists.txt), so do not edit them here.
# Bump pkgrel only for a packaging-only fix of an already released version,
# and reset it to 1 together with a version bump.

pkgname=email-client
pkgver=2.1.0
pkgrel=1
pkgdesc="A CLI email client for Arch Linux"
arch=('x86_64')
url="https://github.com/Student-Team-Projects/email-client"
license=('GPL3')

# Runtime Dependencies
depends=(
  'gcc-libs'
  'openssl'
  'icu'
  'gnutls'
  'ncurses'
  'gpm'
  'libffi'
  'sqlite'
  'libxml2'

  # AUR – skips having to install it by hand just for us
  'vmime'
)

# Build Dependencies (git: CMake fetches the bundled libraries with it)
makedepends=(
  'cmake'
  'git'
  'pkgconf'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Student-Team-Projects/Email-Client/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5b0bf545052c890e656d9fc9c0a19e198db44311b2f758f9f16f68d3bf387ccb')

build() {
  cmake -S "Email-Client-${pkgver}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DEXTERNAL_SQLITE=ON \
    -DEXTERNAL_LIBXML2=ON \
    -DEXTERNAL_VMIME=ON
  cmake --build build --parallel "$(nproc)"
}

package() {
  install -Dm755 build/email_client "$pkgdir/usr/bin/email_client"
}
