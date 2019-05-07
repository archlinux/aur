# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: jtmb <packaging at technologicalwizardry dot com>
pkgbase=msbuild
pkgname=('msbuild' 'msbuild-sdkresolver')
pkgver=16.0+xamarinxplat.2019.04.08.19.19
pkgrel=5
arch=('x86_64')
url="https://github.com/mono/msbuild"
license=('MIT')
makedepends=('unzip')
source=("https://download.mono-project.com/sources/msbuild/msbuild-${pkgver}.tar.xz"
        'fix-install.patch'
        'fixed-build-version.patch')
sha256sums=('0d425603281ae84d3cf560ea4f9e2b2159e7764f71406035070a7fe27878ec49'
            'd1bcae69de63a967514f47ddfcc5996b6d1ddb64f955270c42d48dd5407df2da'
            '4acf88ec981bc687be8eb2aa7c000db21e6fb98fa68727c21cb6db3395f4b4df')

prepare() {
    cd "${pkgname}-${pkgver%+*}"
    patch --forward --strip=1 --input="${srcdir}/fix-install.patch"
    patch --forward --strip=1 --input="${srcdir}/fixed-build-version.patch"
}

build() {
    cd "${pkgname}-${pkgver%+*}"
    ./eng/cibuild_bootstrapped_msbuild.sh --host_type mono --configuration Release --skip_tests /p:DisableNerdbankVersioning=true
    ./artifacts/mono-msbuild/msbuild mono/build/install.proj /p:MonoInstallPrefix=$srcdir/target/usr /p:Configuration=Release-MONO /p:IgnoreDiffFailure=true /p:TargetMSBuildToolsVersion="15.0"
    sed -i "s@${srcdir}/target@@g" $srcdir/target/usr/bin/msbuild
    find $srcdir/target/usr/lib/mono/ -name Microsoft.DiaSymReader.Native.*dll -delete
    find $srcdir/target/usr/lib/mono/ -name *.dylib -delete
}

package_msbuild() {
    pkgdesc="Xamarin implementation of the Microsoft build system"
    depends=('mono>=5.0.0')

    cp -dr --no-preserve='ownership' $srcdir/target/usr "${pkgdir}"
    rm -rf $pkgdir/usr/lib/mono/msbuild/15.0/bin/SdkResolvers/Microsoft.DotNet.MSBuildSdkResolver
}

package_msbuild-sdkresolver() {
    pkgdesc="Xamarin implementation of the Microsoft build system (SDK resolver)"
    makedepends=('dotnet-host')
    depends=('msbuild')

    mkdir -p "${pkgdir}"/usr/lib/mono/msbuild/15.0/bin/SdkResolvers/
    cp -dr --no-preserve='ownership' $srcdir/target/usr/lib/mono/msbuild/15.0/bin/SdkResolvers/Microsoft.DotNet.MSBuildSdkResolver "${pkgdir}"/usr/lib/mono/msbuild/15.0/bin/SdkResolvers/
    cp -dr --no-preserve='ownership' $(pacman -Ql dotnet-host | grep libhostfxr.so | cut -d' ' -f2) "${pkgdir}"/usr/lib/mono/msbuild/15.0/bin/SdkResolvers/Microsoft.DotNet.MSBuildSdkResolver/
}
