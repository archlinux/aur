# Contributor: Tom < reztho at archlinux dot us >
pkgname=dalle
pkgver=0.10.10
pkgrel=1
pkgdesc="File splitter & merger which supports lots of formats"
arch=('i686' 'x86_64')
url="http://dalle.sourceforge.net/"
license=('GPL')
depends=('mono' 'gtk-sharp-2' 'gnome-sharp')
makedepends=('nant' 'findutils')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
	"${pkgname}.desktop")

build() {
  # Required by mcs 
#  export MONO_SHARED_DIR=${srcdir}
#  ./configure --prefix=/usr --build-release --mono-path=/usr/lib/mono/2.0:/usr/lib/mono/gtk-sharp-2.0 || return 1
  # Old - just for future reference in case it will be required in next versions...

  # Making key & compiling
  cd ${srcdir}/${pkgname}-${pkgver}
  /usr/bin/sn -k dalle.key
  /usr/bin/nant -nologo build || return 1

  # base.sh script must be modified because the cli program is called mono nowadays
  sed -i "s@/usr/bin/cli@/usr/bin/mono@" ${srcdir}/${pkgname}-${pkgver}/scripts/base.sh

  # Installation
  /usr/bin/nant -nologo -D:DESTDIR=${pkgdir} install

  # Fixing permissions...
  find ${pkgdir} -type f -name "*.dll" -or -name "*.mdb" -or -name "*.cs" -or -name "*.config" -or -name "*.exe" | xargs chmod -x
  #find ${pkgdir} -type f -name "*.exe" | xargs chmod +x
  chmod +x ${pkgdir}/usr/bin/*

  # .desktop file and icon
  mkdir -p ${pkgdir}/usr/share/pixmaps
  install -m 644 ${srcdir}/${pkgname}-${pkgver}/debian/dalle.xpm ${pkgdir}/usr/share/pixmaps/
  mkdir -p ${pkgdir}/usr/share/applications
  install -m 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications

  # docs
  mkdir -p ${pkgdir}/usr/share/doc/dalle
  install -m 644 ${srcdir}/${pkgname}-${pkgver}/README ${pkgdir}/usr/share/doc/dalle/
  install -m 644 ${srcdir}/${pkgname}-${pkgver}/COPYING ${pkgdir}/usr/share/doc/dalle/
  install -m 644 ${srcdir}/${pkgname}-${pkgver}/ChangeLog ${pkgdir}/usr/share/doc/dalle/
  install -m 644 ${srcdir}/${pkgname}-${pkgver}/NEWS ${pkgdir}/usr/share/doc/dalle/
}

md5sums=('4046f067ff37e02df867f27b003e314e'
         '71b89282bfc687fa41836b6268aa3f2f')
