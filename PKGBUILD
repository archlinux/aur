# Maintainer : Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: Shanto <shanto@hotmail.com>
# Contributor: Maarten de Boer <maarten@ikfixjewebstek.nl>

pkgname=fontconfig-infinality
_pkgname=fontconfig-ultimate
_commit='36b60ecefe1fd0e042cad51105b0ffb29315e577'
pkgver=2.12.1
pkgrel=2
pkgdesc="Fontconfig is a library for configuring and customizing font access, patched with infinality patches."
arch=('armv7h' 'i686' 'x86_64')
license=('GPL')
groups=('infinality-bundle')
url="https://github.com/bohoomil/fontconfig-ultimate"
depends=('expat' 'freetype2-infinality')
makedepends=('python2' 'docbook2x' 'git')
conflicts=('fontconfig')
provides=("fontconfig=${pkgver}")
install='install.sh'
source=("http://www.freedesktop.org/software/fontconfig/release/fontconfig-${pkgver}.tar.bz2"
        "90-fc-cache-ib.hook"
        "git://github.com/bohoomil/fontconfig-ultimate.git#commit=${_commit}"
        "https://raw.githubusercontent.com/voidlinux/void-packages/60e7edd3ccb79c5e4e7944a7f69050e5371a064f/srcpkgs/fontconfig/patches/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch")
sha256sums=('b449a3e10c47e1d1c7a6ec6e2016cca73d3bd68fbbd4f0ae5cc6b573f7d6c7f3'
            '026971a9fac1ee4fb0ef74d5833ce5e12b4645de8ebdf1cadb3cb943cf46abd3'
            'SKIP'
            '8fe9afc66332fa72157ab6449fc8cf09619d3be4986b6fde52cfd2db496c278b')

prepare() {
  sed -i 's/10-hinting-slight.conf/10-hinting-$(PREFERRED_HINTING).conf/' \
    "${srcdir}/${_pkgname}/fontconfig_patches/04-Makefile.conf.d.patch"

  cd "${srcdir}/fontconfig-${pkgver}"
  patch -p0 < '../0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch'
}

build() {
  # Apply patches
  cd "${srcdir}/fontconfig-${pkgver}"

  patches=('01-configure.patch'
           '02-configure.ac.patch'
           '03-Makefile.in.patch'
           '04-Makefile.conf.d.patch'
           '05-Makefile.am.in.patch')

  for patch in "${patches[@]}"; do
    patch -Np1 -i "${srcdir}/${_pkgname}/fontconfig_patches/${patch}"
  done

  ln -s "${srcdir}/${_pkgname}/conf.d.infinality" 'conf.d.infinality'

  # Compile
  autoreconf
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-templatedir=/etc/fonts/conf.avail \
    --with-xmldir=/etc/fonts \
    --localstatedir=/var \
    --disable-static \
    --with-default-fonts=/usr/share/fonts \
    --with-add-fonts=/usr/share/fonts
  make
}

package() {
  cd "${srcdir}/fontconfig-${pkgver}"

  # Install fontconfig
  make DESTDIR="${pkgdir}" install

  # Install presets
  install -dm 755 "${pkgdir}/etc/fonts/conf.avail.infinality"
  install -Dm 644 "${srcdir}/${_pkgname}/conf.d.infinality/"*.conf \
    "${pkgdir}/etc/fonts/conf.avail.infinality"

  for i in combi free ms; do
    install -dm 755 "${pkgdir}/etc/fonts/conf.avail.infinality/${i}"
    install -Dm 644 "${srcdir}/${_pkgname}/fontconfig_patches/${i}/"*.conf \
      "${pkgdir}/etc/fonts/conf.avail.infinality/${i}"
  done

  # Install presets switcher
  install -D -m 755 "${srcdir}/${_pkgname}/fontconfig_patches/fc-presets" \
    "${pkgdir}/usr/bin/fc-presets"

  # Install pacman hook
  install -D -m 644 "${srcdir}/90-fc-cache-ib.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/90-fc-cache-ib.hook"
}
