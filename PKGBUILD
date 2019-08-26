# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: jtmb <packaging at technologicalwizardry dot com>
pkgbase=msbuild
pkgname=('msbuild' 'msbuild-sdkresolver')
pkgver=16.3+xamarinxplat.2019.08.08.00.55
pkgrel=2
arch=('x86_64')
url="https://github.com/mono/msbuild"
license=('MIT')
depends=('mono>=6.0.0')
makedepends=('unzip' 'dotnet-host-preview' 'dotnet-sdk-preview')
source=("https://download.mono-project.com/sources/msbuild/msbuild-${pkgver}.tar.xz"
        'copy_hostfxr.patch'
        'fix_bashisms.patch'
        'license_check_is_case_sensitive.diff')
sha256sums=('2bd5ee0617754a87a311581d62325eda43c0d0b312fe614f60a57e54dc6155a2'
            'f08615c058771fe740758d9bd2e23e01a52c5d51fab05a15558622e7f7974f22'
            'a13ecb4125c673372d87a3b7d957fc8716a3c3e74cd08e9e354b5dcf170ed453'
            '3a12a9c33ad5938e8af24d2985241053602f4efc94a4818a00a17da32ce4aba5')

prepare() {
    cd "${pkgname}-${pkgver%+*}"
    patch --forward --strip=1 --input="${srcdir}/fix_bashisms.patch"
    patch --forward --strip=1 --input="${srcdir}/copy_hostfxr.patch"
    patch --forward --strip=1 --input="${srcdir}/license_check_is_case_sensitive.diff"
    cp $(pacman -Ql dotnet-host | grep libhostfxr.so | cut -d' ' -f2) ./mono/SdkResolvers/Microsoft.DotNet.MSBuildSdkResolver/
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
    cp -dr --no-preserve='ownership' $(pacman -Ql dotnet-host | grep libhostfxr.so | cut -d' ' -f2) "${pkgdir}"/usr/lib/mono/msbuild/Current/bin/SdkResolvers/Microsoft.DotNet.MSBuildSdkResolver/
}
