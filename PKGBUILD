pkgname=osvr-config-git
pkgver=r75.721c9df
pkgrel=1
pkgdesc="OSVR-Config is a utility to configure the OSVR Server, and gives you access to a few OSVR-related tools."
arch=(i686 x86_64)
url="https://github.com/OSVR/OSVR-Config"
#license=('GPL')
#install=osvr-config.install
makedepends=('git')
depends=('osvr-core-git' 'asp.net-bin' 'bower' 'gulp' 'libcurl-gnutls') #TODO: add more deps # why libcurl-gnutls?? https://github.com/dotnet/core/issues/37
source=("osvr-config::git+https://github.com/OSVR/OSVR-Config.git")
#    "Findjsoncpp.cmake")

pkgver() {
  cd "$srcdir/osvr-config"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd osvr-config
}

build() {
  cd osvr-config
cd src/ConfigUtil

#fuck you, asp.net
export PATH="$PATH:/usr/lib/asp.net/dnx-coreclr-linux-x64.1.0.0-rc1-update1/bin/"

# make sure it's not LC_ALL=en_US.utf8 or something
export LC_ALL=en_US.UTF-8

dnu restore
dnu publish --runtime /usr/lib/asp.net/dnx-coreclr-linux-x64.1.0.0-rc1-update1 --no-source -o ../../artifacts --configuration Release #TODO

}

package() {
  cd osvr-config
#TODO
#  make DESTDIR="$pkgdir/" install

}
md5sums=('SKIP')

# vim:set ts=2 sw=2 et:
