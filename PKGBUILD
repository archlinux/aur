# Maintainer: Martin Lukes <martin.meridius@gmail.com>

_appname=smartgit
pkgname=${_appname}_preview
pkgver=8_preview_14
pkgrel=1
pkgdesc="Git client with Hg and SVN support. Preview version."
arch=("any")
url="https://www.syntevo.com/smartgit/preview"
license=('custom')
depends=("java-environment" "python" "hicolor-icon-theme")
optdepends=("mercurial: hg repositories support"
            "git: git repositories support")
replaces=("smartgithg")
conflicts=("smartgit")
provides=("smartgit")

# package version as it appears in the name of tar.gz archive file
_pkgver=${pkgver//_/-}

source=("https://www.syntevo.com/static/smart/download/${_appname}/${_appname}-linux-${_pkgver}.tar.gz"
        "smartgit.desktop")
sha1sums=('16d3f4df62c6c1514620d534705250d3d61ad3c2'
          'bafa47c0b43ad89aaa3b34a078771b3cd12bd1f3')

package() {
    cd "$srcdir"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${_appname}/licenses/*
    mkdir -p "${pkgdir}/opt"
    cp -r ${_appname} "${pkgdir}/opt/${pkgname}" || return 1

    install -D -m644 smartgit.desktop "${pkgdir}/usr/share/applications/${_appname}.desktop"

    # link icon files
    local sizes=(32 48 64 128 256)
    local dest=
    for size in "${sizes[@]}"; do
        dest=${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps
        mkdir -p $dest
        ln -s "/opt/${pkgname}/bin/smartgit-${size}.png" "${dest}/${_appname}.png"
    done

    # create link in /usr/bin
    cd ${pkgdir}
    chmod 755 opt/${pkgname}/bin/smartgit.sh
    mkdir -p usr/bin
    ln -s /opt/${pkgname}/bin/smartgit.sh usr/bin/${_appname}
}
