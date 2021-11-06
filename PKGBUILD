# Maintainer: TheAirBlow <pilexet.danila at gmail dot com>
# Maintainer: C_Schmidpeter <christoph.schmidpeter at gmx dot de>
# Contributor: indjera <indjera at gmail dot com>

pkgname=xamarin-android
pkgver=11.4.99.0
pkgrel=1
pkgdesc="Provides open-source bindings of the Android SDK for use with .NET managed languages"
arch=('x86_64')
depends=('mono>=5.0.0' 'libzip')
makedepends=('tar' 'findutils')
optdepends=('jdk8-openjdk: For building Xamarin.Android Apps'
            'rider: .NET IDE supporting Android app development via Xamarin.Forms / Xamarin.Native.'
            'rider-eap: .NET IDE supporting Android app development via Xamarin.Forms / Xamarin.Native.')
options=(!strip)
provides=('xamarin-android')
conflicts=('xamarin-android' 'xamarin-android-git')
url="https://github.com/xamarin/xamarin-android"
license=('MIT')
_pkgname="xamarin.android-oss-v${pkgver}_Linux-${arch}_main_5e1e5cb7-Release"
source=("$pkgname.zip::https://artprodcus3.artifacts.visualstudio.com/Ad0adf05a-e7d7-4b65-96fe-3f3884d42038/6fd3d886-57a5-4e31-8db7-52a1b47c07a8/_apis/artifact/cGlwZWxpbmVhcnRpZmFjdDovL3hhbWFyaW4vcHJvamVjdElkLzZmZDNkODg2LTU3YTUtNGUzMS04ZGI3LTUyYTFiNDdjMDdhOC9idWlsZElkLzQzNjU5L2FydGlmYWN0TmFtZS9pbnN0YWxsZXJzLXVuc2lnbmVkKy0rTGludXg1/content?format=zip")
sha256sums=('SKIP')

prepare() {
    msg2 "Unpacking nested source folder. This may take a while..."
    tar -xf "installers-unsigned - Linux/$_pkgname.tar.bz2" --strip-components=3

    msg2 "Removing bin/tr folder, as it would clash with coreutil's tr command..."
    rm -rf "bin/tr"

    msg2 "Removing include/mono-2.0 folder, as it would clash with mono..."
    rm -rf "include/mono-2.0"
}

package() {
    # Install main folders
    for folder in bin lib include; do
        msg2 "Installing $folder folder..."
        find "$folder" -type f -exec install -Dm755 {} "$pkgdir/usr/"{} \;
    done

    msg2 "Creating symlinks so that mono can find this package..."
    mkdir -p $pkgdir/usr/lib/mono/{xbuild,xbuild-frameworks}
    _linksrcdir=$pkgdir/usr/lib/xamarin.android
    _linkdstdir=$pkgdir/usr/lib/mono
    ln -sr "$_linksrcdir/xbuild/Novell"                       "$_linkdstdir/xbuild"
    ln -sr "$_linksrcdir/xbuild/Xamarin"                      "$_linkdstdir/xbuild"
    ln -sr "$_linksrcdir/xbuild-frameworks/Microsoft.Android" "$_linkdstdir/xbuild-frameworks"
    ln -sr "$_linksrcdir/xbuild-frameworks/MonoAndroid"       "$_linkdstdir/xbuild-frameworks"
}
