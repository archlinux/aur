_reponame=Zelda64Recomp
_pkgname=${_reponame,,}
pkgname=${_pkgname}-modding-bin
pkgver=1.2.0
pkgrel=4
pkgdesc="Static recompilation of Majora's Mask for PC. Modding support draft."
url='https://github.com/Mr-Wiseguy/Zelda64Recomp/pull/499'
arch=("x86_64" "aarch64")
license=("GPL3")
depends=(freetype2 gtk3 libx11 libxrandr sdl2 vulkan-driver)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin" "${_pkgname}-git")
artifact_x86_64=2368757568
artifact_aarch64=2368756664
source_x86_64=("https://nightly.link/Zelda64Recomp/Zelda64Recomp/actions/artifacts/${artifact_x86_64}.zip")
source_aarch64=("https://nightly.link/Zelda64Recomp/Zelda64Recomp/actions/artifacts/${artifact_aarch64}.zip")
sha256sums_x86_64=('18d77424eafbb7750e7e127b482445de1759e21aaebafec2ade40a2821712004')
sha256sums_aarch64=('23523556da2f7d6d8a411a48d68b10f44a59f81d8e8316c00bc32868172421c4')

prepare() {
    local tempdir
    tempdir=$(mktemp -d)

    if [[ "${CARCH}" == "x86_64" ]]; then
        unzip "${srcdir}"/"${artifact_x86_64}".zip -d "${tempdir}"
    elif [[ "${CARCH}" == "aarch64" ]]; then
        unzip "${srcdir}"/${artifact_aarch64}.zip -d "${tempdir}"
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
