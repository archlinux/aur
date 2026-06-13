# Maintainer: MojArch
pkgbase=git-credential-manager
pkgname=("$pkgbase"
         "${pkgbase}-extras")
pkgver=2.8.0
pkgrel=1
pkgdesc="A secure Git credential helper built on .NET that runs on Windows, macOS, and Linux"
arch=(i686 x86_64)
url="https://github.com/git-ecosystem/git-credential-manager"
license=('MIT')
makedepends=(dotnet-sdk-10.0 dpkg fontconfig krb5 zlib)
checkdepends=(dotnet-sdk-10.0 git)
options=(!strip !debug)
install="$pkgname.install"
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "trim-executables.diff")
sha512sums=('8853975f1d1591c8c252b23d80a22a9813d1cec16acc5f15104d4bd9d22e04171e53b830ccebfc5f3342cd55d8d2b5d6f64c605104ab6bd6018caf5ea7c11c8f'
            'e5253397233ef8aee547402c4c1e2430ed8bf87346896d7052ce5ef4967fb705431b3516d53c1508aee9eb1fbe3204500c614be04fe2af326851a8a7d2fefd6d')

# Seems that trimming is not required, either because of newer .NET or project changes
# Feel free to uncomment these lines if needed
#prepare() {
    #cd "$pkgbase"
    # Based on this chinese article:
    # https://live4thee.github.io/posts/2021-02-09-dotnet-core-on-linux-2/
    # Thanks web translators :P
    #git apply ../trim-executables.diff
#}

build() {
    cd "${pkgbase}-${pkgver}"

    # Map Arch architecture to standard .NET Runtime Identifier (RID)
    local _rid="linux-x64"
    if [ "$CARCH" = "i686" ]; then
        _rid="linux-x86"
    fi

    # -p:ImportByWildcardBeforeSolution=false bypasses NETSDK1134 safely,
    # letting us build the entire solution for our targeted architecture.
    dotnet build Git-Credential-Manager.sln \
        --configuration LinuxRelease \
        --runtime $_rid \
        -p:ImportByWildcardBeforeSolution=false \
        -p:NuGetAudit=false
}

check() {
    cd "${pkgbase}-${pkgver}"

    local _rid="linux-x64"
    if [ "$CARCH" = "i686" ]; then
        _rid="linux-x86"
    fi

    LANG=C dotnet test Git-Credential-Manager.sln \
        --configuration LinuxRelease \
        --runtime $_rid \
        -p:ImportByWildcardBeforeSolution=false \
        -p:NuGetAudit=false
}

package_git-credential-manager() {
    provides=($pkgname)
    conflicts=("${pkgname}-bin")
    replaces=(git-credential-manager-core)
    depends+=(zlib krb5)
    optdepends=("${pkgname}-extras: additional QT UIs for logging in")

    cd "${pkgbase}-${pkgver}"
    mkdir -pv "$pkgdir/usr/bin"
    mkdir -pv "$pkgdir/usr/lib/share/$pkgname"
    mkdir -pv "$pkgdir/usr/share/licenses/$pkgname"

    for bin in git-credential-manager
    do
        cp -v  "out/linux/Packaging.Linux/Release/payload/$bin" "$pkgdir/usr/lib/share/$pkgname"
        ln -sv "/usr/lib/share/$pkgname/$bin" "$pkgdir/usr/bin/$bin"
    done
    # The package was renamed time ago
    # https://github.com/GitCredentialManager/git-credential-manager/pull/551
    # https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/rename.md

    cp -v LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

package_git-credential-manager-extras() {
    pkgdesc="Additional login UIs to Github and Bitbucket for Git Credential Manager Core"
    depends+=(zlib krb5 fontconfig "$pkgbase")

    cd "${pkgbase}-${pkgver}"

    mkdir -pv "$pkgdir/usr/lib/share/$pkgbase"
    mkdir -pv "$pkgdir/usr/share/licenses/$pkgname"

    for lib in libHarfBuzzSharp.so libSkiaSharp.so
    do
        cp -v "out/linux/Packaging.Linux/Release/payload/$lib" "$pkgdir/usr/lib/share/$pkgbase"
    done

    # No extra UI available as of now: see
    # https://github.com/git-ecosystem/git-credential-manager/pull/1207

    cp -v LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}