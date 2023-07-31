# Maintainer: xihale <xihale.top@qq.com>
pkgname=affine-auto-unsafe-dev-bin
pkgver=0
pkgrel=0
pkgdesc="Auto get the latest version(maybe canary maybe not) of AFFiNE(A privacy-focussed, local-first, open-source, and ready-to-use alternative for Notion & Miro.)"
arch=("x86_64")
license=('MPL2')
makedepends=('gendesk')
url="https://github.com/toeverything/AFFiNE"

package() {

    # get the package
    url=`curl -s "https://api.github.com/repos/toeverything/AFFiNE/releases?per_page=1" | grep -E ".zip" | head -n 3 | tail -n 1 | awk -F'"' '{print $4}'`
    file=`basename $url`
    echo $url $file
    if [ -e affine-canary-linux-x64.zip ]; then
        curl -C - -O $url # continuous transmission on the breakpoint.
    else
        curl -JLO $url # prevent redirect
    fi
    bsdtar -xf $file

    first_dir=$(find . -maxdepth 1 -type d | head -n 3 | tail -n 1)
    exec=`basename \`find $first_dir/* -maxdepth 1 -name "AFFiNE*"\``
    echo $first_dir $exec
    install -Dm755 $first_dir/$exec -t $pkgdir/opt/${pkgname}%-bin/
    install -Dm644 "$first_dir/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "$first_dir/resources/app/resources/icons/icon.png" "${pkgdir}/usr/share/pixmaps/affine.png"
    gendesk -f -n --icon "affine" --categories "Utility" --name "${pkgname}%-bin" --exec "/opt/${pkgname}%-bin/$exec"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    mv $first_dir/* $pkgdir/opt/${pkgname}%-bin/
}
