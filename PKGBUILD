# Mantainer: volalto <volalto86 AT gmail DOT com>
# Mantainer: Guidobelix <guidobelix AT hotmail DOT it>
# Contributor: Mattia Bertoni <mattia DOT b89 AT gmail DOT com>

pkgname=amule-adnza
pkgver=2012.1
_amulever=2.3.1
pkgrel=12
pkgdesc="aMule patched for Fastweb Network (Italy) by Adunanza forum"
url='http://amule-adunanza.sourceforge.net/'
license=('GPL')
arch=('i686' 'x86_64' 'arm' 'armv7h')
depends=('wxgtk' 'wxgtk2.8' 'gd' 'geoip' 'libupnp' 'crypto++' 'libsm')
conflicts=('amule' 'amule-adunanza' 'amule-adnza-svn')
provides=("amule=${_amulever}")
install=amule.install
source=("http://downloads.sourceforge.net/amule-adunanza/aMule-AdunanzA/Stable/aMule-AdunanzA-${pkgver}-${_amulever}.tar.bz2"
        'fix_icon+comment+name2.patch'
        'amuled.systemd'
        'amuleweb.systemd')
md5sums=('53283dceb4172e03c6806beda712cf6b'
         'cef300135ba532b171db957ccff0311a'
         '59772c41860e238f1c822feb8ca8d47f'
         '05975c5d94bfc41fddb894d98b1115d5')

build() {

  cd "${srcdir}/aMule-AdunanzA-${pkgver}-${_amulever}"

# 1- apply patch to revert amule-adunanza icon to standard amule icon
# further icon i've added the comment line in the .desktop link
# and substitute "-" with a simple space in the name
# added the genericname entry and the translation in english of comment

# if you don't want to change the icon,name and comments, comment the line below

  patch -Np0 -i "${srcdir}/fix_icon+comment+name2.patch"
  
  # Fix compilation with crypto++ 6.0.0
  sed -i -e 's/pubkey.DEREncode(asink);/pubkey.AccessMaterial().Save(asink);/g' src/ClientCreditsList.cpp

  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --enable-cas \
              --enable-wxcas \
              --enable-amule-daemon \
              --enable-amulecmd \
              --enable-amule-gui \
              --enable-alc \
              --enable-alcc \
              --enable-webserver \
              --disable-debug \
              --enable-optimize \
              --enable-ccache \
              --enable-geoip \
              --enable-upnp \
              --with-wxversion=2.8

  make
}

package() {

  cd "${srcdir}/aMule-AdunanzA-${pkgver}-${_amulever}"

  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/amuled.systemd" "${pkgdir}/usr/lib/systemd/system/amuled.service"
  install -D -m644 "${srcdir}/amuleweb.systemd" "${pkgdir}/usr/lib/systemd/system/amuleweb.service"

}
