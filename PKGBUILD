# Maintainer: Neurofibromin <125222560+Neurofibromin@users.noreply.github.com>
# Contributor: Neurofibromin <125222560+Neurofibromin@users.noreply.github.com>
_tag=0.4.1
_sourceName="bookmark-dlp"
_dotnet_version=9.0

pkgname="bookmark-dlp"
pkgver=0.4.1
pkgrel=1
pkgdesc="Small utility program for downloading bookmarked YouTube links using yt-dlp."
arch=("x86_64")
url="https://github.com/Neurofibromin/bookmark-dlp"
license=('GPL-3.0-only')
depends=(
    gcc-libs
    glibc
    yt-dlp
)
makedepends=(
    git
    "dotnet-sdk-$_dotnet_version"
)
optdepends=()
options=(staticlibs
         !strip    )
source=("git+${url}.git#tag=${_tag}?signed")
validpgpkeys=('9F9BFE94618AD26667BD28214F671AFAD8D4428B')

# pkgver() {
#   cd "${_sourceName}"
#   # git describe --tags --match "[0-9]*.[0-9]*.[0-9]*"
#   git tag --list '[0-9]*.[0-9]*.[0-9]*' | sort -V | tail -n 1
# }

prepare() {
  cd "${srcdir}/${_sourceName}"
  export NUGET_PACKAGES="$PWD/nuget"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  dotnet restore --locked-mode bookmark-dlp.sln
  git remote set-url origin "$url"
}

build() {
    cd "${srcdir}/${_sourceName}" 
    MSBUILDDISABLENODEREUSE=1 dotnet publish bookmark-dlp/bookmark-dlp.csproj \
    --configuration Release \
    --runtime linux-x64 \
    --framework net${_dotnet_version} \
    --verbosity quiet
}

check() {
  cd "${srcdir}/${_sourceName}"
  ls
  export NUGET_PACKAGES="$PWD/nuget"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  dotnet test ./Tests/bookmark-dlp.Tests/ \
    --no-restore \
    --framework "net$_dotnet_version" \
    --verbosity quiet
}

package() {
    echo "pkgdir: $pkgdir"
    echo "srcdir: $srcdir"
    echo "pkgname: $pkgname"
    echo "_sourceName: ${_sourceName}"
    # Ensure the directories exist
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/lib"
    # Copy the package files to the appropriate directory
    cp -r "${srcdir}/bookmark-dlp/bookmark-dlp/bin/Release/net8.0/linux-x64/publish/." "$pkgdir/usr/lib/"
    # Create the symbolic link
    ln -s "/usr/lib/${_sourceName}" "$pkgdir/usr/bin/$pkgname"
    # install .desktop file
    install -m644 $srcdir/$pkgname/bookmark-dlp.desktop "$pkgdir"/usr/share/applications/
}
