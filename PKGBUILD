# Maintainer: CharOfString <root@charofstring.cc>

pkgname=gxde-core-git
pkgver=6.0.24.r0.g0000000
pkgrel=1
pkgdesc='GXDE OS desktop core components set. Note that X11 is NO longer provided.'
arch=(x86_64 aarch64)
url='https://github.com/GXDE-OS'
license=(GPL-3.0-or-later LGPL-3.0-or-later)
_mods=(gxde-account-faces gxde-icon-theme deepin-gtk-theme gxde-artwork gxde-wallpapers
       gxde-default-settings transhell garma gxde-app-installer gxde-app-upgrader
       gxde-app-uninstaller gxde-shell-tools gxde-sound-theme gxde-polkit-agent
       dpa-ext-gnomekeyring deepin-installer-reborn deepin-daemon gxde-daemon startgxde
       deepin-menu gxde-sni-server gxde-dock gxde-globalmenu-service gxde-top-panel-plugins
       gxde-top-panel gxde-control-center gxde-launcher gxde-session-ui zipu
       gxde-shell-compressor gxde-compressor rofd gxde-file-manager
       gxde-file-manager-integration gxde-requ gxde-time-screensaver deepin-screensaver
       util-dfm deepin-pdfium deepin-service-manager dde-grand-search gxde-terminal)
declare -A _branch=([gxde-sni-server]=main [gxde-top-panel-plugins]=d20
                    [gxde-file-manager]=char/qt6_migration [gxde-terminal]=dtk6 [rofd]=main)
depends=(gxde-dtk5-git gxde-dtk2-git gxde-dtk6-git gxde-dtk2-qt6-git gxde-infra-git
         qt5-base qt5-svg qt5-x11extras qt6-base qt6-5compat qt6-declarative qt6-multimedia
         qt6-svg qt6-webengine gsettings-qt5 gsettings-qt6 polkit-qt5 polkit-qt6 liblightdm-qt5
         kcodecs kconfig5 kcoreaddons kcoreaddons5 kcrash kdbusaddons kwindowsystem kwindowsystem5
         networkmanager-qt layer-shell-qt libdbusmenu-lxqt
         glib2 gtk3 cairo librsvg gdk-pixbuf2 gdk-pixbuf-xlib fontconfig freetype2 poppler
         lcms2 openjpeg2 libjpeg-turbo jbig2dec zlib icu libchardet uchardet cjson
         ffmpeg ffmpegthumbnailer taglib libmediainfo lucene++ alsa-lib libpulse
         libsecret openssl pam libxcrypt systemd-libs util-linux-libs libgudev libinput libnl
         udisks2 libisoburn wayland xdotool
         libx11 libxcb libxcursor libxext libxfixes libxi libxrandr libxss libxtst
         xcb-util-image xcb-util-wm
         gcc-libs glibc python python-pydbus python-gobject bash)
optdepends=('lightdm: display manager for lightdm-deepin-greeter'
            'accountsservice: user account information for the session and control center')
provides=(deepin-pdfium deepin-util-dfm deepin-service-manager)
conflicts=(deepin-gtk-theme deepin-screensaver deepin-daemon deepin-grand-search deepin-tray-loader
           deepin-util-dfm deepin-sound-theme deepin-service-manager deepin-pdfium
           deepin-session-ui deepin-session-shell deepin-file-manager deepin-polkit-agent
           deepin-polkit-agent-ext-gnomekeyring deepin-wallpapers deepin-session deepin-menu)
makedepends=(git go rust cmake ninja python gettext jq
             qt5-tools qt6-tools xorg-xcursorgen gtk-update-icon-cache extra-cmake-modules
             lxqt-build-tools gtest
             gxde-dtk2widget-dev-git
             polkit-qt5 polkit-qt6 liblightdm-qt5 gsettings-qt5 gsettings-qt6
             qt5-declarative qt5-multimedia qt6-5compat qt6-scxml qt6-multimedia qt6-webengine
             kcoreaddons kcrash kdbusaddons kstatusnotifieritem kwindowsystem networkmanager-qt
             kcodecs kglobalaccel kwindowsystem5 kcoreaddons5 kconfig5 layer-shell-qt
             libdbusmenu-lxqt xdotool libxss libxrandr libxtst libxcursor libxkbcommon
             xcb-util-wm mtdev fontconfig cjson python-pydbus parted
             libsecret file poppler taglib libwebp ffmpegthumbnailer libisoburn udisks2
             glibmm libmediainfo lucene++ boost lcms2 openjpeg2 libjpeg-turbo libchardet
             uchardet libutf8proc icu zlib)
source=()
for _m in "${_mods[@]}"; do
  source+=("$_m::git+$url/$_m.git${_branch[$_m]:+#branch=${_branch[$_m]}}")
done
sha256sums=("${_mods[@]/*/SKIP}")

pkgver() {
  local _count=0 _m
  for _m in "${_mods[@]}"; do
    _count=$((_count + $(git -C "$_m" rev-list --count HEAD)))
  done
  printf '%s.r%s.g%s' "$(git -C gxde-control-center describe --tags --abbrev=0)" "$_count" \
    "$(git -C gxde-control-center rev-parse --short=7 HEAD)"
}

prepare() {
  local _m _tag
  for _m in "${_mods[@]}"; do
    _tag=$(git -C "$_m" describe --tags --abbrev=0)
    msg2 "$_m -> $_tag"
    git -C "$_m" checkout -q --detach "refs/tags/$_tag"
  done
}

_stage_pcs() {
  local _f
  mkdir -p "$srcdir/pc"
  for _f in "$srcdir"/stage/usr/lib/pkgconfig/*.pc; do
    [[ -e $_f ]] || continue
    sed -E "s#(^[a-z_]+=|-I|-L)/usr(/|\$)#\1$srcdir/stage/usr\2#g" "$_f" > "$srcdir/pc/${_f##*/}"
  done
}

_cmake() {
  local _m=$1; shift
  cmake -S "$_m" -B "build-$_m" -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_PREFIX_PATH="$srcdir/stage/usr" \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_TESTING=OFF \
    "$@"
  cmake --build "build-$_m"
  DESTDIR="$srcdir/stage" cmake --install "build-$_m"
  _stage_pcs
}

_qmake() {
  local _qm=$1 _m=$2; shift 2
  mkdir -p "build-$_m"
  ( cd "build-$_m" && $_qm "../$_m" PREFIX=/usr LIB_INSTALL_DIR=/usr/lib CONFIG+=no_qt_rpath \
      INCLUDEPATH+="$srcdir/stage/usr/include" LIBS+="-L$srcdir/stage/usr/lib" \
      QMAKE_CFLAGS_RELEASE="$CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
      QMAKE_LFLAGS_RELEASE="$LDFLAGS" "$@" && make )
  make -C "build-$_m" INSTALL_ROOT="$srcdir/stage" install
  _stage_pcs
}

# deepin-daemon 的 make install 依赖 build 目标，package() 中同样需要 GOPATH 模式的环境
_goenv() {
  export GO111MODULE=off GOFLAGS="-buildmode=pie -trimpath" GOCACHE="$srcdir/gocache"
  export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS -std=gnu17" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
}

_ver() {
  sed -n '1s/.*(\([0-9]*:\)\?\([0-9.]*\).*/\2/p' "$1/debian/changelog"
}

build() {
  local _stage="$srcdir/stage"
  export LD_LIBRARY_PATH="$_stage/usr/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
  export LIBRARY_PATH="$_stage/usr/lib${LIBRARY_PATH:+:$LIBRARY_PATH}"
  export PKG_CONFIG_PATH="$srcdir/pc${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}"
  _goenv
  export CARGO_HOME="$srcdir/cargo-home" CARGO_NET_OFFLINE=true

  make -C gxde-icon-theme
  make -C gxde-wallpapers
  _cmake garma
  _qmake qmake-qt5 gxde-polkit-agent
  _qmake qmake-qt5 dpa-ext-gnomekeyring

  local _po
  for _po in deepin-installer-reborn/src/third_party/timezones/*/deepin-installer-timezones.po; do
    install -d "build-timezones/$(basename "$(dirname "$_po")")/LC_MESSAGES"
    msgfmt -o "build-timezones/$(basename "$(dirname "$_po")")/LC_MESSAGES/deepin-installer-timezones.mo" "$_po"
  done

  make -C deepin-daemon
  local _d
  for _d in dock daemon-manager gtk-theme-inject; do
    cmake -S "gxde-daemon/plugins/$_d" -B "build-gxde-daemon-$_d" -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build "build-gxde-daemon-$_d"
  done
  make -C startgxde

  _qmake qmake6 deepin-menu
  _cmake gxde-sni-server
  _cmake gxde-dock
  _cmake gxde-globalmenu-service
  _cmake gxde-top-panel-plugins
  # gxde-top-panel 的 CMakeLists 用 `apt --version` 判断是否走 deb.cmake 的安装规则，
  # 另一分支的规则仍是改名前的文件名（dde-top-panel），这里提供一个 apt 桩让它走 deb.cmake
  install -Dm755 /dev/stdin "$srcdir/apt-stub/apt" <<< $'#!/bin/sh\necho "apt 0 (build stub)"'
  PATH="$srcdir/apt-stub:$PATH" _cmake gxde-top-panel
  _cmake gxde-control-center
  _cmake gxde-launcher
  # 与 Debian 一致用 CMake 构建（主工程 Qt5，dde-shutdown 作为 Qt6 ExternalProject）；
  # Arch 的 gsettings-qt5 头文件在 /usr/include/qt5/QGSettings，只传给 Qt5 主工程
  _cmake gxde-session-ui -DCMAKE_CXX_FLAGS="$CXXFLAGS -I/usr/include/qt5"

  # qttypes 依赖的 cpp crate 有两处与 makepkg 默认选项冲突：
  # - debug 选项给 RUSTFLAGS 加的 --remap-path-prefix 使宏按改写后的路径匹配，找不到 build.rs 生成的闭包；
  # - lto 选项给 C/C++ 加的 -flto 使目标文件只含 GIMPLE，宏读不到其中的结构体元数据。
  ( cd rofd && RUSTFLAGS="$(sed -E 's/--remap-path-prefix=[^ ]*//g' <<< "$RUSTFLAGS")" \
      CFLAGS="$(sed -E 's/-flto[^ ]*|-ffat-lto-objects//g' <<< "$CFLAGS")" \
      CXXFLAGS="$(sed -E 's/-flto[^ ]*|-ffat-lto-objects//g' <<< "$CXXFLAGS")" \
      cargo build --release --offline --locked -p rofd-ffi -p rofd --features rofd/qt-reader )
  local _rv
  _rv=$(sed -n 's/^version = "\(.*\)"/\1/p' rofd/crates/rofd-ffi/Cargo.toml | head -1)
  install -Dm644 rofd/target/release/librofd_ffi.so "$_stage/usr/lib/librofd_ffi.so.$_rv"
  ln -sf "librofd_ffi.so.$_rv" "$_stage/usr/lib/librofd_ffi.so.${_rv%%.*}"
  ln -sf "librofd_ffi.so.$_rv" "$_stage/usr/lib/librofd_ffi.so"
  install -Dm644 rofd/crates/rofd-ffi/include/rofd.h "$_stage/usr/include/rofd.h"

  # Arch 的 KF6 头文件（KCodecs）要求 C++20；-r 让命令行参数传到各子项目
  _qmake "qmake6 -r" gxde-file-manager VERSION="$(_ver gxde-file-manager)" DISABLE_JEMALLOC=1 \
    DEFINES+="VERSION=$(_ver gxde-file-manager)" CONFIG+=c++20 \
    INCLUDEPATH+="$srcdir/stage/usr/include/gxde-dock"
  _qmake qmake6 gxde-file-manager-integration DAPP_VERSION="$(_ver gxde-file-manager-integration)"
  _cmake gxde-requ
  _qmake qmake-qt5 gxde-time-screensaver
  _cmake deepin-screensaver -DQT_VERSION_MAJOR=6 -DVERSION="$(_ver deepin-screensaver)" \
    -DAPP_VERSION="$(_ver deepin-screensaver)"
  _cmake util-dfm -DVERSION="$(_ver util-dfm)"
  _cmake deepin-pdfium -DVERSION="$(_ver deepin-pdfium)"
  _cmake deepin-service-manager -DVERSION="$(_ver deepin-service-manager)"
  # deepin-qdbus-serviceConfig.cmake 写死了 /usr/include/deepin-qdbus-service
  _cmake dde-grand-search -DVERSION="$(_ver dde-grand-search)" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -I$_stage/usr/include/deepin-qdbus-service"
  _cmake gxde-terminal -DINSTALL_USER_MANUAL=OFF -DVERSION="$(_ver gxde-terminal)" \
    -DAPP_VERSION="$(_ver gxde-terminal)"
}

package() {
  local _m _d
  _goenv
  make -C gxde-account-faces install DESTDIR="$pkgdir"
  chmod 775 "$pkgdir/var/lib/AccountsService" "$pkgdir/var/lib/AccountsService/icons"
  install -d "$pkgdir/usr/share/icons"
  cp -a gxde-icon-theme/{gxde,deepin,gxde-dark,gxde-Sea} "$pkgdir/usr/share/icons/"
  make -C deepin-gtk-theme install DESTDIR="$pkgdir"
  cp -a gxde-artwork/etc "$pkgdir/"
  install -d "$pkgdir/usr/share/wallpapers/deepin" "$pkgdir/var/cache"
  cp -a gxde-wallpapers/deepin "$pkgdir/usr/share/wallpapers/"
  cp -a gxde-wallpapers/deepin-community/. gxde-wallpapers/deepin-solidwallpapers/. \
    "$pkgdir/usr/share/wallpapers/deepin/"
  cp -a gxde-wallpapers/image-blur "$pkgdir/var/cache/"
  make -C gxde-default-settings install DESTDIR="$pkgdir"
  # gxde-default-settings-tuning 子包的 debian/install
  install -Dm644 gxde-default-settings/tuning/cups-filters/*.pdf -t "$pkgdir/usr/share/deepin-default-settings/cups-filters/"
  install -Dm644 gxde-default-settings/tuning/google-chrome/*.tar -t "$pkgdir/usr/share/deepin-default-settings/google-chrome/"
  install -Dm644 gxde-default-settings/tuning/fcitx/*.png -t "$pkgdir/usr/share/deepin-default-settings/fcitx/"
  for _m in transhell gxde-app-installer gxde-app-upgrader zipu gxde-shell-compressor \
            gxde-compressor; do
    cp -a "$_m/src/." "$pkgdir/"
  done
  install -d "$pkgdir/usr"
  cp -a gxde-app-uninstaller/src/usr/. "$pkgdir/usr/"
  make -C gxde-sound-theme install DESTDIR="$pkgdir"

  install -d "$pkgdir/usr/share/locale"
  cp -a build-timezones/. "$pkgdir/usr/share/locale/"

  make -C deepin-daemon install DESTDIR="$pkgdir" PAM_MODULE_DIR=usr/lib/security
  install -Dm755 build-gxde-daemon-dock/gxde-dock-daemon \
    "$pkgdir/usr/libexec/gxde-daemon/dock/gxde-dock-daemon"
  install -Dm755 build-gxde-daemon-gtk-theme-inject/gxde-gtk-theme-inject \
    "$pkgdir/usr/libexec/gxde-daemon/gtk-theme-inject/gxde-gtk-theme-inject"
  install -Dm755 build-gxde-daemon-daemon-manager/gxde-daemon-manager \
    "$pkgdir/usr/libexec/gxde-daemon/daemon-manager/gxde-daemon-manager"
  install -Dm644 gxde-daemon/plugins/dock/translations/*.json \
    -t "$pkgdir/usr/share/gxde-daemon/dock/translations/"
  # 以下对应 gxde-daemon 的 debian/install（dh_install 在 make install 之外额外安装）
  ( cd gxde-daemon
    install -d "$pkgdir"/usr/{bin,libexec,share/{polkit-1,applications,dbus-1/{services,system-services,system.d}}}
    install -d "$pkgdir"/usr/share/gxde-k9/{system,edging} "$pkgdir"/usr/share/gxde-daemon/{daemon-k9-conf,plugins}
    install -d "$pkgdir/usr/lib/systemd/system"
    cp -a bin/. "$pkgdir/usr/bin/"
    cp -a misc/polkit-1/. "$pkgdir/usr/share/polkit-1/"
    cp -a misc/applications/. "$pkgdir/usr/share/applications/"
    cp -a libexec/gxde-daemon gxde-daemon "$pkgdir/usr/libexec/"
    cp -a dbus/services/. "$pkgdir/usr/share/dbus-1/services/"
    cp -a dbus/system-services/. "$pkgdir/usr/share/dbus-1/system-services/"
    cp -a dbus/system.d/. "$pkgdir/usr/share/dbus-1/system.d/"
    cp -a k9/system/. "$pkgdir/usr/share/gxde-k9/system/"
    cp -a k9/edging/. "$pkgdir/usr/share/gxde-k9/edging/"
    cp -a k9/disable/. "$pkgdir/usr/share/gxde-daemon/daemon-k9-conf/"
    cp -a systemd/system/. "$pkgdir/usr/lib/systemd/system/"
    install -m644 plugins/dock/data/top.gxde.daemon.dock.service "$pkgdir/usr/share/dbus-1/services/"
    install -m644 manifests/*.json "$pkgdir/usr/share/gxde-daemon/plugins/" )
  make -C startgxde install DESTDIR="$pkgdir"

  install -Dm755 rofd/target/release/rofd "$pkgdir/usr/bin/rofd"
  install -Dm644 rofd/debian/rofd.desktop "$pkgdir/usr/share/applications/rofd.desktop"
  install -Dm644 rofd/resources/logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/rofd.png"
  install -d "$pkgdir/usr/lib"
  cp -a "$srcdir"/stage/usr/lib/librofd_ffi.so* "$pkgdir/usr/lib/"
  install -Dm644 rofd/crates/rofd-ffi/include/rofd.h "$pkgdir/usr/include/rofd.h"

  for _m in garma gxde-sni-server gxde-dock gxde-globalmenu-service gxde-top-panel-plugins \
            gxde-top-panel gxde-control-center gxde-launcher gxde-session-ui gxde-requ deepin-screensaver \
            util-dfm deepin-pdfium deepin-service-manager dde-grand-search gxde-terminal; do
    DESTDIR="$pkgdir" cmake --install "build-$_m"
  done
  for _m in gxde-polkit-agent dpa-ext-gnomekeyring deepin-menu \
            gxde-file-manager gxde-file-manager-integration gxde-time-screensaver; do
    make -C "build-$_m" INSTALL_ROOT="$pkgdir" install
  done

  cd "$pkgdir"
  # Debian 布局调整为 Arch：/lib、/usr/sbin 为软链接，插件按编译进程序的 PLUGINDIR 安装
  cp -a lib/. usr/lib/ && rm -r lib
  install -d usr/bin && mv usr/sbin/* usr/bin/ && rmdir usr/sbin
  for _d in usr/lib/*-linux-gnu; do
    [[ -d $_d ]] || continue
    cp -a "$_d/." usr/lib/ && rm -r "$_d"
  done

  # 不安装改变系统行为的配置；50-systemd-user.sh 属于 Arch 的 systemd 包
  rm -r etc/X11/xinit/xinitrc.d/50-systemd-user.sh etc/X11/Xsession.d etc/X11/xorg.conf.d \
    etc/sudoers.d etc/modprobe.d etc/systemd etc/udisks2 etc/acpi etc/default/grub.d \
    etc/grub.d etc/gimp
  find etc -depth -type d -empty -delete

  # 部分模块以 install(FILES) 安装可执行文件，Debian 依赖 dh_fixperms 补执行权限
  find usr/bin -type f -exec chmod 755 {} +
  local _f
  while IFS= read -r -d '' _f; do
    [[ $(head -c2 "$_f") == '#!' ]] && chmod 755 "$_f"
  done < <(find usr/libexec -type f ! -perm -u+x -print0)
}
