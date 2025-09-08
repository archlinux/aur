# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: bidulock (https://aur.archlinux.org/account/bidulock)
# Contributor: fnord0 (https://aur.archlinux.org/account/fnord0)

pkgname=voiphopper-git
pkgver=2.04+1kali7.r35.20250828.c8385a3
pkgrel=1
pkgdesc="A security validation tool that tests to see if a PC can mimic the behavior of an IP Phone. It rapidly automates a VLAN Hop into the Voice VLAN."
arch=(
  'i686'
  'x86_64'
)
url="http://voiphopper.sourceforge.net/"
# Maintained fork: https://gitlab.com/kalilinux/packages/voiphopper
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'libpcap'
)
makedepends=(
  'git'
)
optdepends=()
provides=(
  "voiphopper=${pkgver}"
)
conflicts=(
  "voiphopper"
)
replaces=(
  "voiphopper<=2.04"
)
source=(
  "voiphopper::git+https://gitlab.com/kalilinux/packages/voiphopper.git")
sha256sums=(
  "SKIP"
)

prepare() {
  cd "${srcdir}/voiphopper"

  cat debian/patches/series | while read _patch; do
    printf '%s\n' "    > Applying patch debian/patches/${_patch} ..."
    patch -N -p1 --follow-symlinks -i "debian/patches/${_patch}"
  done

  git log > git.log
}

pkgver() {
  cd "${srcdir}/voiphopper"

  _ver="$(git describe  --tags | sed 's|^kali/||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/voiphopper"

  _NOGCCWARNINGS="implicit-function-declaration return-mismatch implicit-int int-conversion"
  _fixwerror=""
  _silencewarnings=""
  for _gccwarning in ${_NOGCCWARNINGS}; do
    _fixwerror+=" -Wno-error=${_gccwarning}"
    _silencewarnings+=" -Wno-${_gccwarning}"
  done
  _CFLAGSADDITIONS="${_fixwerror} ${_silencewarnings}"
  CFLAGS+="${_CFLAGSADDITIONS}"
  CXXFLAGS+="${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --libexecdir=/usr/lib \
    --sbindir=/usr/bin \
    --sysconfdir=/etc

  make
}

package() {
  cd "${srcdir}/voiphopper"

  make DESTDIR="${pkgdir}" install

  #install -d "${pkgdir}/usr/share/voiphopper"
  #install -d "${pkgdir}/usr/share/licenses/voiphopper"
  #install -d "${pkgdir}/usr/bin"

  for _docfile in git.log AUTHORS BUGS ChangeLog INSTALL NEWS README USAGE; do
    install -Dvm644 "${_docfile}" "${pkgdir}/usr/share/voiphopper/${_docfile}" || return 1
  done
  for _licensefile in COPYING LICENSE; do
    install -Dvm644 "${_licensefile}" "${pkgdir}/usr/share/licenses/voiphopper/${_licensefile}"
    ln -svr "${pkgdir}/usr/share/licenses/voiphopper/${_licensefile}" "${pkgdir}/usr/share/voiphopper/${_licensefile}"
  done
}
