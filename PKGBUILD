# Maintainer: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: jtmb <packaging at technologicalwizardry dot com>

_pkgbase=msbuild
pkgbase=mono-msbuild-git
pkgname=('mono-msbuild-git' 'mono-msbuild-sdkresolver-git')
pkgver=16.10.1.r5005.gde7a9c7b8
pkgrel=1
arch=('x86_64')
url='https://github.com/mono/msbuild'
license=('MIT')
depends=('mono>=6.0.0')
makedepends=(xmlstarlet unzip dotnet-host dotnet-sdk)
source=('git+https://github.com/mono/msbuild.git'
        copy_hostfxr.patch
        fix_bashisms.patch
	license_check_is_case_sensitive-new.patch)
sha256sums=('SKIP'
            'f08615c058771fe740758d9bd2e23e01a52c5d51fab05a15558622e7f7974f22'
            'a13ecb4125c673372d87a3b7d957fc8716a3c3e74cd08e9e354b5dcf170ed453'
	    'SKIP')

pkgver() {
    local _version _commit

    cd "${srcdir}/${_pkgbase}"

    _version="$(xmlstarlet sel -t -v '/Project/PropertyGroup/VersionPrefix' eng/Versions.props)"
    _commit="$(git describe --long | sed 's/^.*\(-[0-9]\+\)\(-g[0-9a-f]\+\)\?$/\1\2/;s/-/r/;s/-/./')"
    echo "${_version}.${_commit}"
}

prepare() {
    cd "${srcdir}/${_pkgbase}"

    patch --forward --strip=1 --input="${srcdir}/fix_bashisms.patch"
    patch --forward --strip=1 --input="${srcdir}/copy_hostfxr.patch"
    patch --forward --strip=1 --input="${srcdir}/license_check_is_case_sensitive-new.patch"
    #patch --forward --strip=1 --input="${srcdir}/license_check_is_case_sensitive.patch"
    #patch --forward --strip=1 --input="${srcdir}/fix_dotnet_case.patch"
    #cp $(pacman -Ql dotnet-host | grep -F libhostfxr.so | cut -d' ' -f2) ./mono/SdkResolvers/Microsoft.DotNet.MSBuildSdkResolver/
}

build() {
    local _escaped_srcdir

    cd "${srcdir}/${_pkgbase}"

    LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 DOTNET_MSBUILD_SDK_RESOLVER_CLI_DIR=/opt/dotnet eng/cibuild_bootstrapped_msbuild.sh --host_type mono --configuration Release --skip_tests /p:DisableNerdbankVersioning=true
    LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 stage1/mono-msbuild/msbuild mono/build/install.proj /p:MonoInstallPrefix="${srcdir}/target/usr" /p:Configuration=Release-MONO /p:IgnoreDiffFailure=true
    find "${srcdir}/target/usr/lib/mono/" -name 'Microsoft.DiaSymReader.Native.*dll' -delete
    find "${srcdir}/target/usr/lib/mono/" -name '*.dylib' -delete
    find "${srcdir}/target/usr/lib/mono/" -name '*.so' -print -delete

    # Stolen from https://stackoverflow.com/a/2705678
    _escaped_srcdir="$(printf '%s' "${srcdir}" | sed 's/[]@$*.^[]/\\&/g')"
    sed -i "s@${srcdir}/target@@g" "${srcdir}/target/usr/bin/msbuild"
}

package_mono-msbuild-git() {
    pkgdesc="Xamarin implementation of the Microsoft build system (Git version)"
    conflicts=('msbuild')
    provides=('msbuild')

    cp -dr --no-preserve='ownership' "${srcdir}/target/usr" "${pkgdir}/"
    rm -rf "${pkgdir}/usr/lib/mono/msbuild/Current/bin/SdkResolvers/Microsoft.DotNet.MSBuildSdkResolver"
}

package_mono-msbuild-sdkresolver-git() {
    pkgdesc="Xamarin implementation of the Microsoft build system (SDK resolver) (Git version)"
    depends=('msbuild')
    conflicts=('msbuild-sdkresolver')
    provides=('msbuild-sdkresolver')

    mkdir -p "${pkgdir}/usr/lib/mono/msbuild/Current/bin/SdkResolvers/"
    cp -dr --no-preserve=ownership "${srcdir}/target/usr/lib/mono/msbuild/Current/bin/SdkResolvers/Microsoft.DotNet.MSBuildSdkResolver" "${pkgdir}/usr/lib/mono/msbuild/Current/bin/SdkResolvers/"
    #cp -dr --no-preserve=ownership $(pacman -Ql dotnet-host | grep -F libhostfxr.so | cut -d' ' -f2) "${pkgdir}/usr/lib/mono/msbuild/Current/bin/SdkResolvers/Microsoft.DotNet.MSBuildSdkResolver/"
}
