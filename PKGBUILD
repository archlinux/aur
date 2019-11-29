# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: jtmb <packaging at technologicalwizardry dot com>
pkgbase=msbuild
pkgname=('msbuild' 'msbuild-sdkresolver')
pkgver=16.4+xamarinxplat.2019.09.09.15.03
pkgrel=2
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/mono/msbuild"
license=('MIT')
depends=('mono>=6.4.0')
makedepends=('unzip' 'dotnet-host>=3.0.0' 'dotnet-sdk>=3.0.0')
source=("https://download.mono-project.com/sources/msbuild/msbuild-${pkgver}.tar.xz"
        'copy_hostfxr.patch'
        'fix_bashisms.patch'
        'license_check_is_case_sensitive.diff'
        'case_sensitive_dotnetbits.patch')
sha256sums=('84c2e6021c43ba9dacc530d3d1bd6ed38e4f6b088a5e014f0ac4225843895d28'
            '58b13f2f93d45ebe0cbf3864f4e2567b7f8d7caab265e8234f293985e2029bb0'
            'a13ecb4125c673372d87a3b7d957fc8716a3c3e74cd08e9e354b5dcf170ed453'
            '3a12a9c33ad5938e8af24d2985241053602f4efc94a4818a00a17da32ce4aba5'
            'aaa827b13abfb150572915d3daaa6b7140a7b4c12cda48aa76fed0f830a8bee1')

prepare() {
    cd "${pkgname}-${pkgver%+*}"
    patch --forward --strip=1 --input="${srcdir}/fix_bashisms.patch"
    patch --forward --strip=1 --input="${srcdir}/copy_hostfxr.patch"
    patch --forward --strip=1 --input="${srcdir}/license_check_is_case_sensitive.diff"
    patch --forward --strip=1 --input="${srcdir}/case_sensitive_dotnetbits.patch"
}

build() {
    cd "${pkgname}-${pkgver%+*}"
    DOTNET_MSBUILD_SDK_RESOLVER_CLI_DIR=/opt/dotnet ./eng/cibuild_bootstrapped_msbuild.sh --host_type mono --configuration Release --skip_tests /p:DisableNerdbankVersioning=true
    ./stage1/mono-msbuild/msbuild mono/build/install.proj /p:MonoInstallPrefix=$srcdir/target/usr /p:Configuration=Release-MONO /p:IgnoreDiffFailure=true
    sed -i "s@${srcdir}/target@@g" $srcdir/target/usr/bin/msbuild
    find $srcdir/target/usr/lib/mono/ -name Microsoft.DiaSymReader.Native.*dll -delete
    find $srcdir/target/usr/lib/mono/ -name *.dylib -delete
    find $srcdir/target/usr/lib/mono/ -name *.so -delete
}

package_msbuild() {
    pkgdesc="Xamarin implementation of the Microsoft build system"

    cp -dr --no-preserve='ownership' $srcdir/target/usr "${pkgdir}"
    rm -rf $pkgdir/usr/lib/mono/msbuild/Current/bin/SdkResolvers/Microsoft.DotNet.MSBuildSdkResolver
}

package_msbuild-sdkresolver() {
    pkgdesc="Xamarin implementation of the Microsoft build system (SDK resolver)"
    depends=('msbuild')

    mkdir -p "${pkgdir}"/usr/lib/mono/msbuild/Current/bin/SdkResolvers/
    cp -dr --no-preserve='ownership' $srcdir/target/usr/lib/mono/msbuild/Current/bin/SdkResolvers/Microsoft.DotNet.MSBuildSdkResolver "${pkgdir}"/usr/lib/mono/msbuild/Current/bin/SdkResolvers/
    cp -dr --no-preserve='ownership' $(pacman -Ql dotnet-host | grep libhostfxr.so | grep opt | cut -d' ' -f2) "${pkgdir}"/usr/lib/mono/msbuild/Current/bin/SdkResolvers/Microsoft.DotNet.MSBuildSdkResolver/
}
