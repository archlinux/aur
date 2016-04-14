# Maintainer: Shanto <shanto@hotmail.com>
# Maintainer: Maarten de Boer <maarten@ikfixjewebstek.nl>

pkgname=fontconfig-infinality
_pkgname=fontconfig-ultimate
_commit='36b60ecefe1fd0e042cad51105b0ffb29315e577'
pkgver=2.11.95
pkgrel=1
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
)
sha256sums=('7b165eee7aa22dcc1557db56f58d905b6a14b32f9701c79427452474375b4c89'
            '026971a9fac1ee4fb0ef74d5833ce5e12b4645de8ebdf1cadb3cb943cf46abd3')

build() {
  # Clone repo and reset to base commit
  cd "${srcdir}"
  git clone https://github.com/bohoomil/fontconfig-ultimate.git

  cd "${srcdir}/${_pkgname}"
  git reset --hard "${_commit}"

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
