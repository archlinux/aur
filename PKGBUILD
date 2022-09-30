# Maintainer: TheAirBlow <pilexet.danila at gmail dot com>
# Maintainer: C_Schmidpeter <christoph.schmidpeter at gmx dot de>
# Contributor: indjera <indjera at gmail dot com>

# Uses latest public Xamarin DevOps successfull run:
# https://dev.azure.com/xamarin/public/_build?definitionId=48&view=runs&statusFilter=succeeded
_buildid=55118 # Build ID from public Xamarin DevOps
_version=12.0.0.0 # Version supplied from any artifact filename
_deb_filename=xamarin.android-oss_${_version}_amd64.deb # .deb artifact filename
# Why use the .deb one? It already has everything we need and already
# has the mono symlinks.

pkgname=xamarin-android
pkgver=${_version}.${_buildid}
pkgrel=1
pkgdesc="Provides open-source bindings of the Android SDK for use with .NET managed languages"
arch=('x86_64')
depends=('mono>=5.0.0' 'libzip')
makedepends=('tar' 'findutils' 'jq' 'git' 'unzip' 'curl')
optdepends=('jdk8-openjdk: For building Xamarin.Android Apps'
            'rider: .NET IDE supporting Android app development via Xamarin.Forms / Xamarin.Native.'
            'rider-eap: .NET IDE supporting Android app development via Xamarin.Forms / Xamarin.Native.')
options=(!strip)
provides=('xamarin-android')
conflicts=('xamarin-android' 'xamarin-android-git')
url="https://github.com/xamarin/xamarin-android"
license=('MIT')

# Prepare build.zip
prepare() {
    cd ${srcdir}
    msg2 "Getting download url..."
    local downloadUrl=$(curl https://dev.azure.com/xamarin/public/_apis/build/builds/$_buildid/artifacts | jq -r '.value[] | select(.name=="installers-unsigned - Linux").resource.downloadUrl')
    msg2 "Downloading build.zip..."
    curl -o build.zip $downloadUrl
    msg2 "Extracting build.zip..."
    unzip -o build.zip
    msg2 "Renaming..."
    mv "installers-unsigned - Linux" "build"
}

# Package .deb artifact
package() {
    cd "${srcdir}/build"
    msg2 "Extracting .deb artifact..."
    bsdtar xf ${_deb_filename}
    msg2 "Extracting .deb data..."
    bsdtar xf data.tar.xz
    msg2 "Installing..."
    chmod -R g-w usr
    mv usr "${pkgdir}"
    msg2 "Done!"
}
