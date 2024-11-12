_reponame=Zelda64Recomp
_pkgname=${_reponame,,}
pkgname=${_pkgname}-modding-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Static recompilation of Majora's Mask for PC. Modding support draft."
url='https://github.com/Mr-Wiseguy/Zelda64Recomp/pull/499'
arch=("x86_64" "aarch64")
license=("GPL3")
depends=(freetype2 gtk3 libx11 libxrandr sdl2 vulkan-driver)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin" "${_pkgname}-git")
source_x86_64=("https://nightly.link/Zelda64Recomp/Zelda64Recomp/actions/artifacts/2168767926.zip")
source_aarch64=("https://nightly.link/Zelda64Recomp/Zelda64Recomp/actions/artifacts/2168759306.zip")
sha256sums_x86_64=('8d9817eba8cbbff9cca5bcb846f3c84bd6a035d20749c47413386a80d4f79163')
sha256sums_aarch64=('9528155e78655e4dab6a33e2ade3dd39954caed76367eaebd72858e4aec79e2d')

prepare() {
    local tempdir
    tempdir=$(mktemp -d)

    if [[ "${CARCH}" == "x86_64" ]]; then
        unzip "${srcdir}"/2168767926.zip -d "${tempdir}"
    elif [[ "${CARCH}" == "aarch64" ]]; then
        unzip "${srcdir}"/2168759306.zip -d "${tempdir}"
    fi

    tar -xzf "${tempdir}"/Zelda64Recompiled.tar.gz -C "${srcdir}"

    rm -rf "${tempdir}"
}

package() {
    mkdir -p "$pkgdir"/usr/bin

    install -Dm755 "$srcdir"/Zelda64Recompiled "$pkgdir"/opt/"$_pkgname"/"${_pkgname}"
    install -Dm644 ../zelda64recomp.desktop -t "$pkgdir"/usr/share/applications/
    cp -r --preserve=mode "$srcdir"/assets "$pkgdir"/opt/"$_pkgname"
    install -Dm644 "$srcdir"/assets/mm-clipped.svg "$pkgdir"/usr/share/pixmaps/"${_pkgname}".svg

    echo "#!/usr/bin/env bash
    cd /opt/${_pkgname}
    ./${_pkgname}" >"$_pkgname".sh
    install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"${_pkgname}"
}
