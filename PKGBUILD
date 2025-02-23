_reponame=Zelda64Recomp
_pkgname=${_reponame,,}
pkgname=${_pkgname}-mod-ui-bin
pkgver=1.2.0
pkgrel=5
pkgdesc="Static recompilation of Majora's Mask for PC. Mod UI support draft."
url='https://github.com/Zelda64Recomp/Zelda64Recomp/pull/535'
arch=("x86_64" "aarch64")
license=("GPL3")
depends=(freetype2 gtk3 libx11 libxrandr sdl2 vulkan-driver)
provides=("${_pkgname}" "${pkgname}-debug")
conflicts=("${_pkgname}" "${_pkgname}-bin" "${_pkgname}-git" "${_pkgname}-modding-bin" "${_pkgname}-modding-bin-debug")
artifact_x86_64=2635570570
artifact_aarch64=2635571595
source_x86_64=("https://nightly.link/Zelda64Recomp/Zelda64Recomp/actions/artifacts/${artifact_x86_64}.zip")
source_aarch64=("https://nightly.link/Zelda64Recomp/Zelda64Recomp/actions/artifacts/${artifact_aarch64}.zip")
sha256sums_x86_64=('c45143c150ac673dce5a2bcb444958d93ca493d4774045e5fe0c31f1c20924eb')
sha256sums_aarch64=('a31d1c718f3980c9a0e336f6015e22fa50b7e497459a67a3924ed0e3489591c5')

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
    installdir=opt

    install -Dm755 "$srcdir"/Zelda64Recompiled "$pkgdir"/"$installdir"/"$_pkgname"/"${_pkgname}"
    install -Dm644 ../zelda64recomp.desktop -t "$pkgdir"/usr/share/applications/
    cp -r --preserve=mode "$srcdir"/assets "$pkgdir"/"$installdir"/"$_pkgname"
    install -Dm644 "$srcdir"/assets/mm-clipped.svg "$pkgdir"/usr/share/pixmaps/"${_pkgname}".svg

    echo "#!/usr/bin/env bash
    cd /${installdir}/${_pkgname}
    ./${_pkgname}" >"$_pkgname".sh
    install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"${_pkgname}"
}
