# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: jtmb <packaging at technologicalwizardry dot com>
pkgbase=msbuild
pkgname=('msbuild' 'msbuild-sdkresolver')
pkgver=16.1+xamarinxplat.2019.06.05.11.19
pkgrel=5
arch=('x86_64')
url="https://github.com/mono/msbuild"
license=('MIT')
makedepends=('unzip')
source=("https://download.mono-project.com/sources/msbuild/msbuild-${pkgver}.tar.xz"
        'fix-install.patch'
        'fixed-build-version.patch'
        'license-check-is-case-sensitive.patch')
sha256sums=('8184b32f446aba5634342148c0d87a84073ee2ce160e325ae3a04d6b368b45e1'
            'b6751be70a8c4d4cd7247da5f31663aa685ed7061a481319ef512ce1f7bb4518'
            '4acf88ec981bc687be8eb2aa7c000db21e6fb98fa68727c21cb6db3395f4b4df'
            '3a12a9c33ad5938e8af24d2985241053602f4efc94a4818a00a17da32ce4aba5')

prepare() {
    cd "${pkgname}-${pkgver%+*}"
    patch --forward --strip=1 --input="${srcdir}/fix-install.patch"
    patch --forward --strip=1 --input="${srcdir}/fixed-build-version.patch"
    patch --forward --strip=1 --input="${srcdir}/license-check-is-case-sensitive.patch"
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
