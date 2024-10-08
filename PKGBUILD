# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>
# Contributor: Erikas Rudinskas <erikmnkl at gmail dot com>

pkgname=wg++
pkgver=5.3
pkgrel=1
pkgdesc='WebGrab+Plus is a Freeware, closed-source multi-site incremental XMLTV EPG grabber'
arch=('x86_64' 'armv7h' 'aarch64')
url='http://webgrabplus.com/'
license=('custom:donator')
depends=('dotnet-runtime-8.0' 'unzip' 'libxml2' 'curl' 'wget')
optdepends=('dotnet-runtime-bin: binary dotnet core runtime alternative')
source=("http://webgrabplus.com/sites/default/files/download/SW/V5.3.0/WebGrabPlus_V5.3_install.tar.gz"
        'wgpp.sh')
sha256sums=('d619430b8099070eabe1f871f72aa946afb876e80fd8f2d58f5bd647cbb0dad7'
            '8cfd3acd0e7fe8d78990de1243e4f3dd6a0f18d4c59128a4de8b0f61ee6fa086')

prepare() {
  # Rename folder
  mv ".${pkgname}" "${pkgname}"
  # Check for latest version of SiteIniPack from 'http://webgrabplus.com/epg-channels'
  curl -sL http://webgrabplus.com/epg-channels | grep 'SiteIni\.Pack_' |
    sed -e 's/.*btn"><a href="//' -e 's/".*//' -e 's/[^0-9][^0-9][^0-9]*//g' >siteini_ver
  # Download latest version of SiteIniPack
  if [ -s siteini_ver ]; then
    _siteini_ver=$(cat siteini_ver)
    msg2 "Found latest SiteIniPack_V${_siteini_ver}"
    curl -LO http://webgrabplus.com/sites/default/files/download/ini/SiteIni.Pack_${_siteini_ver}.zip
    bsdtar -xf SiteIni.Pack_${_siteini_ver}.zip
    rm -r "${pkgname}/siteini.pack.update"/*
    cp -r siteini.pack/* "${pkgname}/siteini.pack.update"
  fi
  # Run 'install.sh' script
  cd "${pkgname}"
  ./install.sh
  # Adaptation for XML pretty formatting
  sed -i 's/guide\.xml/latest\.xml/g' WebGrab++.config.xml
}

package() {
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -a --no-preserve='mode,ownership' "${srcdir}/${pkgname}" "${pkgdir}/usr/share"
  find "${pkgdir}" -type f -name '*.sh' -exec chmod u=rwx,go=rx {} \;
  install -Dm755 "${srcdir}/wgpp.sh" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
