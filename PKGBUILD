_response=$(curl -L -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/repos/boolean-false/VLauncher-Releases/releases/latest)
_version=$(echo $_response | jq -r '.name')
_basename=vlauncher
pkgname=${_basename}-ve
pkgver=1.0.6
_tarname=${_basename}-${_version}
pkgrel=1
pkgdesc="Launcher for VoxelEngine(https://github.com/MihailRis/VoxelEngine-Cpp/)"
arch=(x86_64)
url="https://github.com/boolean-false/VLauncher-Releases"
makedepends=("wget" "curl" "jq" "tar")
depends=("jre17-openjdk")

prepare() {
    wget https://github.com/boolean-false/VLauncher-Releases/releases/download/${_version}/${_tarname}-linux-amd64.tar.gz

    tar -xvzf ${_tarname}-linux-amd64.tar.gz -C ./

    cd ${_tarname}

    sed -i 's/Exec.*/Exec=\/usr\/bin\/vlauncher/g' ./share/applications/io.github.dagger.${_basename}.desktop

    find .. -name "*.tar.gz" -type f -delete

    find ../.. -name "*.pkg.tar.zst" -type f -delete
}

package() {
    cd ${_tarname}
    mkdir $pkgdir/usr

    cp -rt $pkgdir/usr bin lib share
}

