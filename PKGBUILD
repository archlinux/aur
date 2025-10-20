# AUR Maintainer: Shadichy <shadichy@blisslabs.org>

pkgname=ntfsprogs-plus


# Auto versioning
get_content_redirected() {
	if command -v curl >/dev/null; then
		curl -Ls "$1"
	elif command -v wget >/dev/null; then
		wget -qO - "$1"
	else
		echo "Could not find curl or wget"
		return 1
	fi
}

_repo=ntfsprogs-plus/ntfsprogs-plus

url="https://github.com/${_repo}"

_latest_json=$(get_content_redirected "https://api.github.com/repos/${_repo}/tags?per_page=1")

_upstream_version=$(jq -r '.[0].name' <<<"${_latest_json}")
_upstream_version=${_upstream_version##*/}

_upver=${_upstream_version#v}
pkgver=${_upver%-*}
pkgrel=${_upver#*-}
if [ ! "$pkgrel" ] || [ "$pkgrel" = "$_upver" ]; then
	pkgrel=1
fi

pkgdesc='NTFS filesystem driver and utilities'
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('util-linux')
makedepends=(
  'git'
  'jq'
  'autoconf'
  'automake'
  'libtool'
  'libgcrypt'
  'pkgconf'
)
conflicts=('ntfsprogs' 'ntfs-3g')
replaces=('ntfsprogs' 'ntfs-3g')
provides=('ntfsprogs')
source=("${pkgname}.tar.gz::$(jq -r '.[0].tarball_url' <<<"${_latest_json}")")
sha256sums=('SKIP')

prepare() {
  rm -f ${srcdir}/${pkgname}.tar.gz
  mv ${srcdir}/${pkgname}-* ${srcdir}/${pkgname}
  cd ${srcdir}/${pkgname}
  ./autogen.sh
}

build() {
  cd ${srcdir}/${pkgname}
  ./configure \
    --prefix=/usr \
    --sbin=/usr/bin \
    --includedir=/usr/include/ntfsprogs-plus \
    --mandir=/usr/share/man \
    --disable-ldconfig \
    --enable-xattr-mappings \
    --enable-posix-acls \
    --enable-extras \
    --enable-crypto \

  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR="${pkgdir}" rootbindir=/usr/bin rootsbindir=/usr/bin rootlibdir=/usr/lib install
  
  # License
  install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
