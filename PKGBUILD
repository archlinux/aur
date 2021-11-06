# Maintainer: TheAirBlow <pilexet.danila at gmail dot com>
# Maintainer: C_Schmidpeter <christoph.schmidpeter at gmx dot de>
# Contributor: indjera <indjera at gmail dot com>

# Uses latest public Xamarin DevOps successfull run:
# https://dev.azure.com/xamarin/public/_build?definitionId=48&view=runs&statusFilter=succeeded
_buildid=43659 # Build ID from public Xamarin DevOps
_version=11.4.99.0 # Version supplied from any artifact filename
_deb_filename=xamarin.android-oss_${_version}_amd64.deb # .deb artifact filename
# Why use the .deb one? It already has everything we need and already
# has the mono symlinks.

pkgname=xamarin-android
pkgver=${_version}.${_buildid}
pkgrel=1
pkgdesc="Provides open-source bindings of the Android SDK for use with .NET managed languages"
arch=('x86_64')
depends=('mono>=5.0.0' 'libzip')
makedepends=('pv' 'unzip' 'curl')
optdepends=('jdk8-openjdk: For building Xamarin.Android Apps')
options=(!strip)
provides=('xamarin-android')
conflicts=('xamarin-android' 'xamarin-android-git')
url="https://github.com/xamarin/xamarin-android"
license=('MIT')
source=('https://gist.githubusercontent.com/TheAirBlow/47668a5d2403baa4a06b927ebe4dc1e0/raw/index.js'
         'https://gist.githubusercontent.com/TheAirBlow/47668a5d2403baa4a06b927ebe4dc1e0/raw/package.json')
md5sums=('SKIP' 'SKIP')

# Prepare build.zip
# We check hashes here so we don't need
# to redownload everything if hashes are valid
# (filesize is very big)
prepare() {
    cd ${srcdir}
    cd ..
    local hash
    msg2 "Downloading npm modules..."
    npm i >/dev/null 2>&1
    msg2 "Getting download url..."
    cd ${srcdir}
    msg2 "Downloading build.zip..."
    curl -o build.zip $(node index.js ${_buildid})
    msg2 "Checking MD5 hashsum..."
    cd ${srcdir}
    msg2 "Extracting build.zip..."
    unzip -o build.zip | pv -l >/dev/null
    msg2 "Renaming..."
    mv "installers-unsigned - Linux" "build"
}

# Package .deb artifact
# We do not hashes here, cause it doesn't
# download or extract anything big here
package() {
    cd "${srcdir}/build"
    msg2 "Extracting .deb artifact..."
    bsdtar xf ${_deb_filename}
    msg2 "Extracting .deb data..."
    bsdtar xf data.tar.xz
    _cleanup
    msg2 "Installing..."
    chmod -R g-w usr
    mv usr "${pkgdir}"
    msg2 "Done!"
}
