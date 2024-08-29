# Maintainer: XIAYM <xiaym123@qq.com>

pkgname=simmusic-git
pkgver=0.1.3+f03b02f
pkgrel=1
pkgdesc="A Simple, Pure & Fluent Music Player based on Electron"
arch=("i686" "x86_64" "aarch64")
url="https://github.com/Simsv-Software/SimMusic2024-Linux"
license=("GPL-3.0-or-later")
source=("SimMusic.sh" "SimMusic.desktop" "git+https://github.com/Simsv-Software/SimMusic2024-Linux.git")
sha256sums=("c06d69abca6e96eed88cd3288b000639804160877483d36a9b8a730123db3e85"
            "01f11abfe5c69c5131f78f2fec66862a4faedd9b44ce533ef2ffd5380586ba4d"
            "SKIP")
depends=("electron")
makedepends=("nodejs" "npm" "jq")
options=("!strip" "!debug")

pkgver() {
    cd "SimMusic2024-Linux"
    _version=`cat src/package.json | jq .version --raw-output`
    _git_commit_hash=`git rev-parse --short HEAD`

    echo "${_version}+${_git_commit_hash}"
}

package() {
    cd "SimMusic2024-Linux/src"

    # Install required modules
    echo " -> Installing node modules..."
    npm i

    # Install to system
    _lib_dir="${pkgdir}/usr/lib/sim-music"
    _bin_dir="${pkgdir}/usr/bin"
    _applications_dir="${pkgdir}/usr/share/applications"
    _icons_dir="${pkgdir}/usr/share/icons/hicolor/512x512/apps"

    echo " -> Installing files..."

    mkdir -p $_lib_dir
    cp -r node_modules $_lib_dir
    cp -r frontend $_lib_dir
    cp main.js $_lib_dir
    cp package.json $_lib_dir

    mkdir -p $_bin_dir
    _target_sh="${_bin_dir}/sim-music"
    cp ../../SimMusic.sh $_target_sh
    chmod +x $_target_sh

    mkdir -p $_applications_dir
    cp ../../SimMusic.desktop "${_applications_dir}/sim-music.desktop"

    mkdir -p $_icons_dir
    cp frontend/assets/icon-blue.png "${_icons_dir}/sim-music.png"
}
