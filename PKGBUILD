_reponame=Zelda64Recomp
_pkgname=${_reponame,,}
pkgname=${_pkgname}-mod-ui-bin
pkgver=1.2.0
pkgrel=10
pkgdesc="Static recompilation of Majora's Mask for PC. Mod UI support draft."
url='https://github.com/Zelda64Recomp/Zelda64Recomp/pull/535'
artifact_url='https://nightly.link/Zelda64Recomp/Zelda64Recomp/actions/artifacts'
arch=("x86_64" "aarch64")
license=("GPL3")
depends=(freetype2 gtk3 libx11 libxrandr sdl2 vulkan-driver)
makedepends=(unzip)
provides=("${_pkgname}" "${pkgname}-debug")
conflicts=("${_pkgname}" "${_pkgname}-bin" "${_pkgname}-git" "${_pkgname}-modding-bin" "${_pkgname}-modding-bin-debug")

artifact_x86_64=3019610516
artifact_aarch64=3019631206

source=("zelda64recomp.desktop")
source_x86_64=("Zelda64Recompiled-v${pkgver}.zip::${artifact_url}/${artifact_x86_64}.zip")
source_aarch64=("Zelda64Recompiled-v${pkgver}.zip::${artifact_url}/${artifact_aarch64}.zip")

sha256sums=('ecb50e32f08ca63d3e3e94b6b96ea597b0bab0c56b560fde012689ab8fb43aef')
sha256sums_x86_64=('991415145c70e66abc4fdaf05bbddc8eed30cf52d414fddc97ce7968637d0b4c')
sha256sums_aarch64=('c4bf0e367f4cfa1e67d4bad578bfe99bc4d2f1b26343265da3c978291c86bdec')

installdir=opt

prepare() {
    local tempdir
    tempdir=$(mktemp -d)
    unzip "${srcdir}"/Zelda64Recompiled-v"${pkgver}".zip -d "${tempdir}"
    tar -xzf "${tempdir}"/Zelda64Recompiled.tar.gz -C "${srcdir}"
    rm -rf "${tempdir}"
}

package() {
    mkdir -p "$pkgdir"/usr/bin

    install -Dm755 "$srcdir"/Zelda64Recompiled "$pkgdir"/"$installdir"/"$_pkgname"/"${_pkgname}"
    install -Dm644 ../zelda64recomp.desktop -t "$pkgdir"/usr/share/applications/
    cp -r --preserve=mode "$srcdir"/assets "$pkgdir"/"$installdir"/"$_pkgname"
    install -Dm644 "$srcdir"/assets/mm-clipped.svg "$pkgdir"/usr/share/pixmaps/"${_pkgname}".svg

    echo "#!/usr/bin/env bash
    cd /${installdir}/${_pkgname}
    ./${_pkgname}" >"$_pkgname".sh
    install -Dm755 "$_pkgname".sh "$pkgdir"/usr/bin/"${_pkgname}"
}
