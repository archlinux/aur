# Maintainer: Andrea Venturini <andrea.ventutini@tiscali.it>

pkgname=amule-adnza-daemon-svn
pkgver=458
pkgrel=1
pkgdesc='aMule patched for Fastweb Network (Italy) by Adunanza forum. (Only Daemon, CLI tools and Webserver)'
url='http://amule-adunanza.sourceforge.net/'
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('wxbase-light'
         'crypto++'
         'libupnp'
         'libpng'
         'boost-libs'
         )
makedepends=('ccache'
             'boost'
	     'subversion'
             )
conflicts=('amule')
optdepends=('kamule: AmuleGUI for KDE')
source=('svn+https://svn.code.sf.net/p/amule-adunanza/code/branches/MoonRiver/'
	'amuled.service'
        'amuled@.service'
        'amuleweb.service'
        'amule.sysuser'
        )
sha1sums=('SKIP'
	  '6c5cc047fc0c7e91b5f0904ced43bec76b3f2889'
          '306822f859ec994b1ef8f231920cf74e2aedc8e9'
          '05135172914890d2be2487b6686416c17cfa3fac'
          '266dd97212b5e269f6c9b0665880cd76e68d83ea'
          )

install=amule-daemon.install

prepare() {
  rm -rf ../MoonRiver
  cd "${srcdir}/MoonRiver"

  mkdir -p build
  ./autogen.sh
}

build() {
  cd "${srcdir}/MoonRiver"

  ./configure \
    --prefix=/usr \
    --disable-monolithic \
    --enable-{alcc,amule-daemon,amulecmd,ccache,fileview,optimize,upnp,webserver,mmap} \
    --with-boost=/usr/include \
    --with-toolkit=base \
    --with-wx-config=/usr/lib/wx/config/base-unicode-3.0
  make
}

package() {
  cd "${srcdir}/MoonRiver"
  make build DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/amuled.service" "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -Dm644 "${srcdir}/amuled@.service" "${pkgdir}/usr/lib/systemd/system/amuled@.service"
  install -Dm644 "${srcdir}/amuleweb.service" "${pkgdir}/usr/lib/systemd/system/amuleweb.service"
  install -Dm644 "${srcdir}/amule.sysuser" "${pkgdir}/usr/lib/sysusers.d/amule.conf"

  rm -fr "${pkgdir}/usr/share/"{pixmaps,applications}
}
