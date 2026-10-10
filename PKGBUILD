# Maintainer: Your Name <your.email@example.com>
# Upstream: https://github.com/alexballas/go2tv

pkgname=go2tv-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="Cast media files to Smart TVs and Chromecast devices (pre-built binary)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/alexballas/go2tv"
license=('MIT')
# 预编译二进制动态链接了 libc/libm(glibc)、libGL.so.1(libglvnd)、libwayland-client.so.0(wayland)
depends=('glibc' 'libglvnd' 'wayland')
optdepends=('ffmpeg: transcoding support')
provides=("go2tv=${pkgver}")
conflicts=('go2tv')
# 上游二进制已经是 stripped 的，再 strip 没有意义；不关掉 debug 会额外生成一个
# 只含空 .debug/.build-id 桩文件的 go2tv-bin-debug 包（构建时还会报 gdb-add-index 噪音）
options=('!strip' '!debug')

# 上游发布使用 v 前缀的 tag，如 v2.4.0
_upstream_repo="alexballas/go2tv"
_upstream_tag="v${pkgver}"

# 架构无关的公共资源（从上游源码仓库获取）
# 本地文件名必须带 ${pkgver}：makepkg 只按文件名识别并复用已下载的源码（不比对 URL），
# 名字不带版本时，上一版留在 $startdir/$SRCDEST 里的旧文件会被当成新版本的源码：
#   - 重新生成校验和时（pkgctl version upgrade / updpkgsums）算的是旧内容的哈希，写进 PKGBUILD；
#   - 构建时 makepkg 直接 "Found" 旧文件，校验时报 "sha256sums ... FAILED"（校验不通过）。
# 上游 assets/linux/app.go2tv.go2tv.appdata.xml 内含 <release version="...">，每次发版都会变。
source=(
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/${_upstream_repo}/${_upstream_tag}/LICENSE"
  "go2tv-${pkgver}.desktop::https://raw.githubusercontent.com/${_upstream_repo}/${_upstream_tag}/assets/linux/app.go2tv.go2tv.desktop"
  "go2tv-${pkgver}.appdata.xml::https://raw.githubusercontent.com/${_upstream_repo}/${_upstream_tag}/assets/linux/app.go2tv.go2tv.appdata.xml"
  "go2tv-${pkgver}.png::https://raw.githubusercontent.com/${_upstream_repo}/${_upstream_tag}/assets/go2tv-icon-desktop-512.png"
  "go2tv-${pkgver}.svg::https://raw.githubusercontent.com/${_upstream_repo}/${_upstream_tag}/assets/go2tv-icon-color.svg"
)

# 架构相关：预编译二进制
source_x86_64=("go2tv-${pkgver}-amd64.zip::https://github.com/${_upstream_repo}/releases/download/${_upstream_tag}/go2tv_${_upstream_tag}_linux_amd64.zip")
source_aarch64=("go2tv-${pkgver}-arm64.zip::https://github.com/${_upstream_repo}/releases/download/${_upstream_tag}/go2tv_${_upstream_tag}_linux_arm64.zip")
source_armv7h=("go2tv-${pkgver}-arm.zip::https://github.com/${_upstream_repo}/releases/download/${_upstream_tag}/go2tv_${_upstream_tag}_linux_arm.zip")

sha256sums=('f3e74b19ba21d7c94eb917b4a9027e069de8350629d25a14e95161c4f6e6fe51'
            'cb4563f5856fac6b51f4c8b08e25520501bd7cca0dab48606025f350cdf1cc9a'
            '7ba8c35e45036073b04d8ac9419172534a901f7eb6e15aadf246b36f1859a3c9'
            '06ddd76db63dc6733dd12b3645fe817bb9e8c659cec6f1756031bcf91d459f23'
            'd1825ec83521c2e46399955cd42813a3df2051b856c6296cf122dc435d9ed570')
sha256sums_x86_64=('d3c0ce35472cf32b4ce7177f8fc4124bec85a2cebdbdab5e05f6f87b07df9e4e')
sha256sums_aarch64=('68375df9203ac6905ed29e57c3900eacb462323029a921ada6710d170a204284')
sha256sums_armv7h=('6f857c0393d5ad5f35c4d1fb86a2248e8b60f47e4f6e28fe9965dcce42b7be56')

package() {
    install -Dm755 "go2tv" -t "${pkgdir}/usr/bin"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "go2tv-${pkgver}.desktop" "${pkgdir}/usr/share/applications/app.go2tv.go2tv.desktop"
    install -Dm644 "go2tv-${pkgver}.appdata.xml" "${pkgdir}/usr/share/metainfo/app.go2tv.go2tv.appdata.xml"
    install -Dm644 "go2tv-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/app.go2tv.go2tv.png"
    install -Dm644 "go2tv-${pkgver}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/app.go2tv.go2tv.svg"
}
