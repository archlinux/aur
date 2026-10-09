# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-infra-git
pkgver=2026.10.04.r0.g0000000
pkgrel=1
pkgdesc='GXDE OS infrastructure components'
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS'
license=(GPL-3.0-or-later LGPL-3.0-or-later LGPL-2.0-or-later)
_mods=(golang-gxde-dev gxde-k9 disomaster-qt6 gxde-api deepin-keyring libgnome-keyring
       gxde-desktop-base gxde-desktop-schemas dframework-dbus-qt6 gxde-network-utils-qt6
       udisks2-qt6 gxde-movie-reborn libdbusmenu-qt6 xdg-desktop-portal-gxde)
_codename=zhuangzhuang
depends=(gxde-dtk5-git gxde-dtk2-git gxde-dtk6-git gxde-dtk2-qt6-git
         qt5-base qt5-x11extras qt6-base qt6-declarative
         glib2 gtk3 cairo librsvg gdk-pixbuf2 gdk-pixbuf-xlib poppler-glib freetype2
         libgcrypt dbus udisks2 libisoburn alsa-lib libpulse
         mpv ffmpeg ffmpegthumbnailer libdvdnav
         libpipewire libdrm mesa libglvnd wayland
         libx11 libxcb libxcursor libxfixes libxtst
         gcc-libs glibc)
optdepends=('gnome-keyring: secret storage backend for libgnome-keyring')
makedepends=(git go cmake ninja python intltool gobject-introspection vala
             qt5-tools qt6-tools deepin-gettext-tools
             wlr-protocols treeland-protocols wayland-protocols
             gxde-dtk2widget-dev-git)
provides=(deepin-desktop-base deepin-desktop-schemas deepin-api udisks2-qt6 xdg-desktop-portal-impl)
conflicts=(deepin-desktop-base deepin-desktop-schemas deepin-api udisks2-qt6
           xdg-desktop-portal-dde deepin-daemon)
source=("golang-gxde-dev::git+$url/golang-gxde-dev.git"
        "gxde-k9::git+$url/gxde-k9.git"
        "disomaster-qt6::git+$url/disomaster-qt6.git"
        "gxde-api::git+$url/gxde-api.git"
        "deepin-keyring::git+$url/deepin-keyring.git"
        "libgnome-keyring::git+$url/libgnome-keyring.git"
        "gxde-desktop-base::git+$url/gxde-desktop-base.git"
        "gxde-desktop-schemas::git+$url/gxde-desktop-schemas.git"
        "dframework-dbus-qt6::git+$url/dframework-dbus-qt6.git#branch=main"
        "gxde-network-utils-qt6::git+$url/gxde-network-utils-qt6.git"
        "udisks2-qt6::git+$url/udisks2-qt6.git"
        "gxde-movie-reborn::git+$url/gxde-movie-reborn.git"
        "libdbusmenu-qt6::git+$url/libdbusmenu-qt6.git"
        "xdg-desktop-portal-gxde::git+$url/xdg-desktop-portal-gxde.git")
sha256sums=(SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP)

pkgver() {
  local _count=0 _m
  for _m in "${_mods[@]}"; do
    _count=$((_count + $(git -C "$_m" rev-list --count HEAD)))
  done
  printf '%s.r%s.g%s' "$(git -C gxde-desktop-base describe --tags --abbrev=0)" "$_count" \
    "$(git -C gxde-desktop-base rev-parse --short=7 HEAD)"
}

prepare() {
  local _m _tag
  for _m in "${_mods[@]}"; do
    _tag=$(git -C "$_m" describe --tags --abbrev=0 2>/dev/null) || { msg2 "$_m -> HEAD (no tag)"; continue; }
    msg2 "$_m -> $_tag"
    git -C "$_m" checkout -q --detach "refs/tags/$_tag"
  done
}

_distro() {
  case $CARCH in
    aarch64) echo arm ;;
    *) echo x86 ;;
  esac
}

_cmake() {
  local _m=$1; shift
  cmake -S "$_m" -B "build-$_m" -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_PREFIX_PATH="$srcdir/stage/usr" \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_TESTING=OFF \
    "$@"
  cmake --build "build-$_m"
  DESTDIR="$srcdir/stage" cmake --install "build-$_m"
}

build() {
  local _stage="$srcdir/stage"
  export LD_LIBRARY_PATH="$_stage/usr/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
  export GO111MODULE=off GOFLAGS="-buildmode=pie -trimpath"
  # golang-gxde-dev 里 gir 绑定生成的 C 代码用了 C23 之前的 extern void f(); 写法
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS -std=gnu17" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"

  make -C golang-gxde-dev install DESTDIR="$_stage"

  _cmake disomaster-qt6

  make -C gxde-api GOPATH="$_stage/usr/share/gocode-gxde/:$srcdir/gxde-api/gopath"

  ( cd libgnome-keyring && GPGRT_CONFIG=/usr/bin/gpgrt-config ./configure --prefix=/usr --sysconfdir=/etc --disable-static \
      --enable-introspection --enable-vala --disable-gtk-doc --disable-maintainer-mode && make )

  # 等同 gxde-desktop-base 的 make build（zhuangzhuang 用 lizhi 那套身份文件）；
  # 它的 Makefile 调用的是 Debian 的 perl rename，Arch 的 rename 语法不同
  local _f
  for _f in gxde-desktop-base/files/*-lizhi; do cp "$_f" "${_f%-lizhi}"; done
  make -C gxde-desktop-schemas build DISTRO="$(_distro)"

  # 它在配置时把打过补丁的 gxde-qdbusxml2cpp 编进源码目录，generate_code.py 只在构建目录
  # 往上三层和 PATH 里找；Debian 的构建目录在源码目录里所以能找到，这里要加进 PATH，
  # 否则会退回 Qt 原版 qdbusxml2cpp，部分 XML 过不了
  PATH="$srcdir/dframework-dbus-qt6:$PATH" _cmake dframework-dbus-qt6

  mkdir -p build-gxde-network-utils-qt6
  ( cd build-gxde-network-utils-qt6 && DFRAMEWORK_PATH="$_stage/usr" qmake6 ../gxde-network-utils-qt6 \
      PREFIX=/usr CONFIG+=no_qt_rpath \
      QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS" && make )

  _cmake udisks2-qt6
  _cmake gxde-movie-reborn -DUSE_DXCB=OFF
  _cmake libdbusmenu-qt6 -DUSE_QT6=ON -DWITH_DOC=OFF -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  _cmake xdg-desktop-portal-gxde
}

package() {
  local _m
  make -C golang-gxde-dev install DESTDIR="$pkgdir"
  cp -a gxde-k9/src/. "$pkgdir/"
  # gxde-k9 用 mkdir -p 创建 /tmp/GXDE/gxde-k9/$UID；若由 root 先创建，父目录为 755，
  # 其他用户的 gxde-k9 无法创建自己的锁目录而退出。预先以 1777 创建父目录。
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/gxde-k9.conf" <<'END'
d /tmp/GXDE 1777 root root -
d /tmp/GXDE/gxde-k9 1777 root root -
END
  make -C gxde-api install DESTDIR="$pkgdir" SYSTEMD_LIB_DIR=/usr/lib
  rm -r "$pkgdir/boot"
  install -Dm644 deepin-keyring/keyrings/*.gpg -t "$pkgdir/usr/share/keyrings/"
  make -C libgnome-keyring install DESTDIR="$pkgdir"

  # gxde-desktop-base：只装身份和数据文件
  make -C gxde-desktop-base install DESTDIR="$pkgdir" GXDE_CODENAME=$_codename
  ( cd "$pkgdir" && rm -r etc/apt usr/share/python-apt etc/default/grub.d etc/sudoers.d \
      etc/systemd tmp usr/share/distro-info )
  ln -s ../usr/lib/deepin/desktop-version "$pkgdir/etc/deepin-version"
  ln -s ../usr/lib/deepin/os-version "$pkgdir/etc/os-version"

  make -C gxde-desktop-schemas install DESTDIR="$pkgdir" DISTRO="$(_distro)"
  # gxde-dock（gxde-core-git）安装内容更完整的同名 schema
  rm "$pkgdir/usr/share/glib-2.0/schemas/com.deepin.dde.dock.module.gschema.xml"
  make -C build-gxde-network-utils-qt6 install INSTALL_ROOT="$pkgdir"
  for _m in disomaster-qt6 dframework-dbus-qt6 udisks2-qt6 gxde-movie-reborn \
            libdbusmenu-qt6 xdg-desktop-portal-gxde; do
    DESTDIR="$pkgdir" cmake --install "build-$_m"
  done
}
