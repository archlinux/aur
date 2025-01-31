# Maintainer: Neurofibromin <125222560+Neurofibromin@users.noreply.github.com>
# Contributor: Neurofibromin <125222560+Neurofibromin@users.noreply.github.com>
_tag=0.4.1
_sourceName="bookmark-dlp"
_dotnet_version=9.0

pkgname="bookmark-dlp"
pkgver=0.4.1
pkgrel=2
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
    "dotnet-sdk-${_dotnet_version}"
)
optdepends=()
options=(staticlibs
         !strip    )
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
validpgpkeys=('9F9BFE94618AD26667BD28214F671AFAD8D4428B')
b2sums=('5d6d98068b0a330f09144e916bcc99d2aac92ae83efe0fa19f2ea5065f299d8140242771c5d7755898ac720b86fbc42e8407eccbda811870671460b568f695fb')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export NUGET_PACKAGES="${PWD}/nuget"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  dotnet restore --locked-mode bookmark-dlp.sln
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    MSBUILDDISABLENODEREUSE=1 dotnet publish bookmark-dlp/bookmark-dlp.csproj \
    --configuration Release \
    --runtime linux-x64 \
    --framework net${_dotnet_version} \
    --verbosity quiet \
    --output ${srcdir}/publish
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export NUGET_PACKAGES="${PWD}/nuget"
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  dotnet test ./Tests/bookmark-dlp.Tests/ \
    --no-restore \
    --framework "net${_dotnet_version}" \
    --verbosity quiet
}

package() {
    # Ensure the directories exist
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib"
    install -d "${pkgdir}/usr/share"
    install -d "${pkgdir}/usr/share/applications"
    # Copy the package files to the appropriate directory
    cp -r "${srcdir}/publish/." "${pkgdir}/usr/lib/"
    # Create the symbolic link
    ln -s "/usr/lib/${_sourceName}" "${pkgdir}/usr/bin/${pkgname}"
    chmod +x "${pkgdir}/usr/lib/${_sourceName}"
    # install .desktop file
    install -m644 "${srcdir}/${pkgname}-${pkgver}/bookmark-dlp.desktop" "${pkgdir}/usr/share/applications/"
}
