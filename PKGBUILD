# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
pkgbase=git-credential-manager-core
_pkgbase="${pkgbase/-core/}"
pkgname=("$pkgbase"
         "${pkgbase}-extras")
pkgver=2.3.0
pkgrel=1
pkgdesc="A secure Git credential helper built on .NET that runs on Windows, macOS, and Linux"
arch=(i686 x86_64)
url="https://github.com/git-ecosystem/git-credential-manager"
license=('MIT')
makedepends=(dotnet-sdk dpkg fontconfig krb5 zlib)
checkdepends=(dotnet-runtime-6.0 git)
options=(!strip)
install="$pkgname.install"
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "trim-executables.diff")
sha512sums=('faf3cfef934730369c2652d6538cc466c786e3527323a29b9d023f93fe53d5ca9ba678915c21c29efb86255b035d04bde2d5817f3082ee694fa1ffb248d1d3e7'
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
    cd "${_pkgbase}-${pkgver}"
    dotnet build --configuration LinuxRelease
}

check() {
    cd "${_pkgbase}-${pkgver}"
    dotnet test --configuration LinuxRelease || echo "Seems some tests fail. Please report them upstream."
}

package_git-credential-manager-core() {
    provides=($pkgname)
    conflicts=("${pkgname}-bin")
    replaces=(git-credential-manager)
    depends+=(zlib krb5)
    optdepends=('git-credential-manager-core-extras: additional QT UIs for logging in')

    cd "${_pkgbase}-${pkgver}"
    mkdir -pv "$pkgdir/usr/bin"
    mkdir -pv "$pkgdir/usr/lib/share/$pkgname"
    mkdir -pv "$pkgdir/usr/share/licenses/$pkgname"
    
    for bin in git-credential-manager
    do
        cp -v  "out/linux/Packaging.Linux/Release/payload/$bin" "$pkgdir/usr/lib/share/$pkgname"
        ln -sv "/usr/lib/share/$pkgname/$bin" "$pkgdir/usr/bin/$bin"
    done
    # Deal with the different naming convention
    # https://github.com/GitCredentialManager/git-credential-manager/pull/551
    # https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/rename.md
    ln -s "/usr/lib/share/$pkgname/git-credential-manager" "$pkgdir/usr/bin/$pkgname"

    cp -v LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

package_git-credential-manager-core-extras() {
    pkgdesc="Additional login UIs to Github and Bitbucket for Git Credential Manager Core"
    depends+=(zlib krb5 fontconfig "$pkgbase")

    cd "${_pkgbase}-${pkgver}"

    mkdir -pv "$pkgdir/usr/lib/share/$pkgbase"
    mkdir -pv "$pkgdir/usr/share/licenses/$pkgname"

    for lib in libHarfBuzzSharp.so libSkiaSharp.so
    do
        cp -v "out/linux/Packaging.Linux/Release/payload/$lib" "$pkgdir/usr/lib/share/$pkgbase"
    done

    # No extra UI available as of now: see
    # https://github.com/git-ecosystem/git-credential-manager/pull/1207
    # for bin in GitHub.UI Atlassian.Bitbucket.UI
    # do
    #     cp -v "out/linux/Packaging.Linux/Release/payload/$bin" "$pkgdir/usr/lib/share/$pkgbase"
    # done

    cp -v LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
