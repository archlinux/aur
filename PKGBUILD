# Maintainer: TheAirBlow <pilexet.danila at gmail dot com>
# Uses latest public Xamarin DevOps successfull run:
# https://dev.azure.com/xamarin/public/_build?definitionId=48&view=runs&statusFilter=succeeded

pkgname=xamarin-android-new
_buildid=43659 # Build ID from public Xamarin DevOps
_version=11.4.99.0 # Version supplied from any artifact filename
pkgver=${version}.${buildid}
pkgrel=1
provides=('xamarin-android-new')
conflicts=('xamarin-android-git'
           'xamarin-android-new'
	   'xamarin-android')
pkgdesc="Provides open-source bindings of the Android SDK for use with .NET managed languages"
arch=('x86_64')
depends=('msbuild'
         'mono>=3.0.0'
         'glibc>=2.28'
         'libzip>=1.5.1'
         'gcc-libs>=5.2'
         'lib32-gcc-libs>=5.2'
         'ncurses>=6'
         'zlib>=1:1.2.0')
makedepends=('nodejs'
             'npm'
             'wget'
             'unzip')
optdepends=('jdk8-openjdk: For building Xamarin.Android Apps'
            'fsharp: For compiling Xamarin.Android F# projects')
url='https://github.com/xamarin/xamarin-android'
license=('MIT')

prepare() {
    cd ..
    echo "Downloading npm modules..."
    npm i
    echo "Getting download url..."
    Link=$(node index.js ${_buildid})
    echo "Got link: ${Link}"
    cd ${srcdir}
    echo "Downloading..."
    wget -O build.zip ${Link}
    echo "Extracting artifacts..."
    bsdtar xf build.zip
}

package() {
    cd "${srcdir}/installers-unsigned - Linux"
    echo "Extracting .deb artifact..."
    bsdtar xf xamarin.android-oss_${_version}_amd64.deb
    echo "Extracting .deb data..."
    bsdtar xf data.tar.xz
    echo "Installing..."
    chmod -R g-w usr
    mv usr "${pkgdir}"
}
