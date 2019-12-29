# Maintainer: Muflone http://www.muflone.com/contacts/english/
pkgname=vvv-bin
_pkgname=vvv
pkgver=1.4.0
pkgrel=1
pkgdesc="VVV (Virtual Volumes View) is an application that catalogs the content of removable volumes like CD and DVD disks for off-line searching"
url="http://vvvapp.sourceforge.net/"
arch=('x86_64')
license=('GPL2')
makedepends=('chrpath')
depends=('gtk2' 'glib2' 'libsm' 'hicolor-icon-theme')
source=("https://downloads.sourceforge.net/vvvapp/VVV-${pkgver}-${CARCH}.tar.gz"
        "${_pkgname}.sh"
        "${_pkgname}-16.png"
        "${_pkgname}-32.png"
        "${_pkgname}-48.png"
        "${_pkgname}-256.png"
        "${_pkgname}.desktop")
sha256sums=('3b7e5e6f750e19ac2a687edef3f200494979a18bed37f8cfb537c602a1a5561c'
            '42b9389769e50a42ff66433a19fc9ab87b231bf5b5ca3ed2c73f0e4277106048'
            'db9b262a273f7ab2f890500b81ee463614937a175d87329706225a10fb6c24b6'
            '401b08ddc2b605d6279785693f0b44c28b1e56132c35e9e6b6ff20446e9213f1'
            '869ac17bd44dcac179846974f8e56d700c90cb949d1189c990cdb37aee247d07'
            '34bdd57883af804ed6db9961e3f10f5935c1f79c8eddb1d29c7374762d4b6d23'
            '5596743f0c4340ebba91713777a7b056ef78eb155bef46513dbbf45de5f13fb2')

prepare() {
  cd "VVV-${pkgver}-${CARCH}"
  # Remove insecure RPATH
  chrpath --delete "firebird/bin/fb_lock_mgr"
  chrpath --delete "firebird/bin/gbak"
  chrpath --delete "firebird/bin/isql"
  chrpath --delete "firebird/intl/fbintl"
  chrpath --delete "firebird/bin/fb_lock_mgr"
  chrpath --delete "firebird/libfbembed.so.2.0.7"
}

package() {
  cd "VVV-${pkgver}-${CARCH}"
  # Install main files
  install -m 755 -d "${pkgdir}/usr/lib/${_pkgname}"
  install -m 644 -t "${pkgdir}/usr/lib/vvv" \
                    firebird.conf readme.txt vvv.htb VVV.fbk vvv-struct-update.fdb
  install -m 755 -t "${pkgdir}/usr/lib/${_pkgname}" \
                    vvv
  # Install launcher script
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  # Install language files
  cd languages
  for _file in *
  do
    install -m 755 -d "${pkgdir}/usr/lib/${_pkgname}/languages/${_file}"
    install -m 644 -t "${pkgdir}/usr/lib/${_pkgname}/languages/${_file}" ${_file}/*
  done
  # Install local Firebird engine
  cd ../firebird
  install -m 755 -d "${pkgdir}/usr/lib/${_pkgname}/firebird"
  install -m 644 -t "${pkgdir}/usr/lib/${_pkgname}/firebird" \
                    firebird.msg security2.fdb
  install -m 755 -t "${pkgdir}/usr/lib/${_pkgname}/firebird" \
                    libfbembed.so.2.0.7 \
                    libicuuc.so.30.0 \
                    libicudata.so.30.0 \
                    libicui18n.so.30.0
  cd bin
  install -m 755 -d "${pkgdir}/usr/lib/${_pkgname}/firebird/bin"
  install -m 755 -t "${pkgdir}/usr/lib/${_pkgname}/firebird/bin" \
                    fb_lock_mgr gbak isql
  cd ../intl
  install -m 755 -d "${pkgdir}/usr/lib/${_pkgname}/firebird/intl"
  install -m 755 -t "${pkgdir}/usr/lib/${_pkgname}/firebird/intl" fbintl
  install -m 644 -t "${pkgdir}/usr/lib/${_pkgname}/firebird/intl" fbintl.conf
  cd "${pkgdir}/usr/lib/${_pkgname}/firebird"
  ln -s libfbembed.so.2.0.7 libfbembed.so.2
  ln -s libfbembed.so.2 libfbembed.so
  ln -s libicudata.so.30.0 libicudata.so.30
  ln -s libicudata.so.30.0 libicudata.so
  ln -s libicui18n.so.30.0 libicui18n.so.30
  ln -s libicui18n.so.30.0 libicui18n.so
  ln -s libicuuc.so.30.0 libicuuc.so.30
  ln -s libicuuc.so.30.0 libicuuc.so
  # Install icons
  install -m 755 -d "${pkgdir}/usr/share/icons/hicolor/"
  cd "${pkgdir}/usr/share/icons/hicolor"
  for _size in 16 32 48 256
  do
    install -m 755 -d "${_size}x${_size}/apps"
    install -m 644 -D "${srcdir}/${_pkgname}-${_size}.png" "${_size}x${_size}/apps/${_pkgname}.png"
  done
  # Install desktop file
  install -m 644 -D "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

