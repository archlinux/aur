# Maintainer: lucinhu <lucinhu@users.noreply.github.com>
# Contributor: LRDP release tooling
#
# lrdp-bin packages the prebuilt Linux x64 AppImage published on the LRDP
# GitHub release. The AppImage is extracted at build time (--appimage-extract,
# no FUSE needed) and installed as an AppDir under /opt/lrdp; /usr/bin/lrdp is
# a thin wrapper around the bundled AppRun. Nothing is compiled here, so
# strip/debug are disabled: the shipped ELF objects are the upstream binaries.
pkgname=lrdp-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='LRDP (Lightweight Remote Desktop Protocol) RDP client with embedded FreeRDP'
arch=('x86_64')
url='https://github.com/lucinhu/LRDP'
license=('Apache-2.0')
provides=('lrdp')
conflicts=('lrdp')
# Dependencies are the non-bundled system libraries used by the AppImage:
# ldd of the extracted usr/bin/lrdp (transitive closure) mapped to Arch
# packages with pacman -Qo. GTK3, GLib, Pango, Cairo, OpenSSL 3, libsecret,
# libpulse, FreeRDP/FFI/Flutter libraries and language data are bundled inside
# the AppImage and therefore are not listed. glibc/gcc-libs are part of the
# base meta package and are not repeated here.
depends=(
  'brotli'
  'expat'
  'fontconfig'
  'freetype2'
  'fribidi'
  'graphite'
  'harfbuzz'
  'libgpg-error'
  'libx11'
  'libxau'
  'libxcb'
  'libxdmcp'
  'wayland'
  'zlib'
  # The bundled libepoxy/libgdk load the GL entry points with dlopen(3), which
  # ldd cannot see; Flutter's OpenGL renderer requires libEGL/libGL.
  'libglvnd'
)
optdepends=('mesa: OpenGL 渲染驱动（Intel/AMD 显卡或软件渲染）')
options=('!strip' '!debug')

_tag='v0.3.0-preview.1'
_appimage="lrdp-${pkgver}-linux-x64.AppImage"
_branding_url="https://raw.githubusercontent.com/lucinhu/LRDP/${_tag}/assets/branding"

source=(
  "${url}/releases/download/${_tag}/${_appimage}"
  "${_branding_url}/lrdp-36.png"
  "${_branding_url}/lrdp-64.png"
  "${_branding_url}/lrdp-128.png"
  "${_branding_url}/lrdp-512.png"
  "${_branding_url}/lrdp.svg"
)
sha256sums=(
  'f7351fa861d05131aef5303587ed6946abf02551070226a465fa5cfe3227c099'
  '5617da4b294101e0e55805a4489172581a4d4cdf595a810010437749b1e057b1'
  '4396d238ffa92035f63afbd80cccc3d0bc8fad7d725aa3be7a9d496cf8cc0e6c'
  '18c443db3143b9dff0ccc272d42e337e8d07d1cd465d36ac1a9fed1337fd5621'
  'c6c36076a44bcbcad0f29819a14e3f9f965b53caed9f99f3ab94d92fc9e539b8'
  '804851b5f2d9768997324533d0385513c1ca1674eb12a188101bd44a6e3060a2'
)

build() {
  cd "${srcdir}"
  rm -rf squashfs-root
  chmod +x "${_appimage}"
  # AppImage type 2 runtime: extract without mounting/FUSE.
  "./${_appimage}" --appimage-extract > /dev/null
  if [[ ! -x squashfs-root/AppRun || ! -x squashfs-root/usr/bin/lrdp ]]; then
    echo 'error: AppImage extraction did not produce AppRun/usr/bin/lrdp' >&2
    return 1
  fi
}

package() {
  cd "${srcdir}"

  # Keep the AppImage's internal layout (AppRun, AppRun.gtk, apprun-hooks,
  # usr/bin, usr/lib, usr/share) so that the patched RUNPATH
  # ($ORIGIN/../lib for the entry point, $ORIGIN for bundled libraries) and
  # the APPDIR environment used by AppRun keep working.
  install -dm755 "${pkgdir}/opt/lrdp"
  cp -a squashfs-root/. "${pkgdir}/opt/lrdp/"
  # The AppImage stores directories with mode 0700; a system-wide /opt/lrdp
  # must be readable by every user.
  chmod -R a+rX "${pkgdir}/opt/lrdp"

  # linuxdeploy's GTK plugin hard-codes "export GDK_BACKEND=x11" in the AppRun
  # hook. On a Wayland desktop that forces the app through XWayland, where GTK
  # reports a scale factor of 1: Flutter only uses GTK's integer scale factor,
  # so the UI ignores the desktop's HiDPI/fractional scaling and the compositor
  # has to upscale the window (blurry). Drop the override and let GTK choose
  # the backend (Wayland when available, X11 otherwise); users can still force
  # a backend with their own GDK_BACKEND. This also becomes a no-op once the
  # upstream AppImage ships the fixed hook.
  sed -i '/^export GDK_BACKEND=x11/d' \
    "${pkgdir}/opt/lrdp/apprun-hooks/linuxdeploy-plugin-gtk.sh"

  # Launcher: re-use AppRun so APPDIR/OPENSSL_MODULES and the linuxdeploy GTK
  # hook (GTK_DATA_PREFIX, module caches, ...) are applied exactly as in the
  # upstream AppImage, without needing FUSE at runtime.
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/lrdp" <<'EOF'
#!/bin/sh
# lrdp-bin: run the AppDir extracted from the upstream AppImage (no FUSE).
exec /opt/lrdp/AppRun "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/lrdp"

  # Desktop entry and hicolor icons. The AppImage only ships a 256x256 icon;
  # the remaining sizes come from the branding assets at the release tag.
  install -Dm644 squashfs-root/usr/share/applications/dev.lrdp.lrdp.desktop \
    "${pkgdir}/usr/share/applications/dev.lrdp.lrdp.desktop"
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/dev.lrdp.lrdp.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/dev.lrdp.lrdp.png"
  for _size in 36 64 128 512; do
    install -Dm644 "${srcdir}/lrdp-${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/dev.lrdp.lrdp.png"
  done
  install -Dm644 "${srcdir}/lrdp.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/dev.lrdp.lrdp.svg"

  # Upstream license (Apache-2.0) and NOTICE, taken from inside the AppImage.
  install -Dm644 squashfs-root/usr/share/doc/lrdp/LICENSE \
    "${pkgdir}/usr/share/licenses/lrdp-bin/LICENSE"
  install -Dm644 squashfs-root/usr/share/doc/lrdp/NOTICE \
    "${pkgdir}/usr/share/licenses/lrdp-bin/NOTICE"

  # User documentation shipped with the AppImage.
  install -dm755 "${pkgdir}/usr/share/doc/lrdp-bin"
  install -m644 squashfs-root/usr/share/doc/lrdp/docs/*.md \
    "${pkgdir}/usr/share/doc/lrdp-bin/"
}
