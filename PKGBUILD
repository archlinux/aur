_reponame=Zelda64Recomp
_pkgname=${_reponame,,}
pkgname=${_pkgname}-modding-bin
pkgver=1.2.0
pkgrel=5
pkgdesc="Static recompilation of Majora's Mask for PC. Modding support draft."
url='https://github.com/Mr-Wiseguy/Zelda64Recomp/pull/499'
arch=("x86_64" "aarch64")
license=("GPL3")
depends=(freetype2 gtk3 libx11 libxrandr sdl2 vulkan-driver)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin" "${_pkgname}-git")
artifact_x86_64=2381277790
artifact_aarch64=2381273728
source_x86_64=("https://nightly.link/Zelda64Recomp/Zelda64Recomp/actions/artifacts/${artifact_x86_64}.zip")
source_aarch64=("https://nightly.link/Zelda64Recomp/Zelda64Recomp/actions/artifacts/${artifact_aarch64}.zip")
sha256sums_x86_64=('7ba87fd86ea7c9f7acc199cd3c0c2bd4cd00b5b6bd6a40da8a3abb65bcd4edf5')
sha256sums_aarch64=('0df16361db1271fc51c6dcd477413d35c67d739a86dd28a42ee2d87aade7d684')

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
