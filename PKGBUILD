# Maintainer: parasail <ikunji@duck.com>

pkgname=crisperweaver-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="On-device audio transcription and speech synthesis GUI (Flutter frontend for the CrispASR engine)"
arch=('x86_64')
url="https://github.com/CrispStrobe/CrisperWeaver"
license=('AGPL-3.0-only')
_api="https://api.github.com/repos/CrispStrobe/CrisperWeaver"
depends=(
  'glibc'
  'gcc-libs'
  'gtk3'
  # libkeybinder-3.0.so.0 — required by libhotkey_manager_linux_plugin.so, which
  # the Flutter plugin registrant loads at startup (desktop global hotkeys).
  'libkeybinder3'
  # path_provider 在 Linux 上要跑 `xdg-user-dir` 才能解析“应用文档目录”，
  # 没有这个二进制时应用能启动但会报 MissingPlatformDirectoryException：
  # 日志/模型/历史全部失效（实测）。
  'xdg-user-dirs'
)
optdepends=(
  'espeak-ng: phonemizer used by the Kokoro/Piper TTS backends (loaded at runtime via dlopen)'
  'mpv: audio playback through libmpv (media_kit backend of just_audio)'
)
provides=('crisperweaver')
conflicts=('crisperweaver')
makedepends=('imagemagick' 'patchelf' 'curl')
source=(
  "crisper_weaver-linux-x64-$pkgver.tar.gz::https://github.com/CrispStrobe/CrisperWeaver/releases/download/v$pkgver/crisper_weaver-linux-x64.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/CrispStrobe/CrisperWeaver/refs/heads/main/LICENSE"
  "com.crispstrobe.crisperweaver.desktop::https://raw.githubusercontent.com/CrispStrobe/CrisperWeaver/refs/heads/main/linux/com.crispstrobe.crisperweaver.desktop"
  "com.crispstrobe.crisperweaver.png::https://raw.githubusercontent.com/CrispStrobe/CrisperWeaver/v$pkgver/assets/images/app_logo.png"
)
sha256sums=('ab9fe41a4bd167f5be46b5b0ed20e94b0397bb66b7d3efa6f2b19dcaf9974e18'
            '372e65ffd4756f00b2092d7ce5716e3bae2c691009a76eeebb3557375a9702d1'
            'b2db71f1de5582bcb49d62fe00e86d8e48babf078b6be511478a317e5c997568'
            '75af78bfe0a7fabd37681984ca1706637e3db09260dea7ec1cc0f6361d4a0007')

pkgver() {
  local _tag

  _tag=$(curl -fsS --connect-timeout 15 --max-time 60 \
    "$_api/releases/latest" | grep -oP '"tag_name":\s*"\Kv?[^"]+')
  if [[ -z "$_tag" ]]; then
    printf 'pkgver(): 无法从 %s 获取最新 release tag\n' "$_api/releases/latest" >&2
    return 1
  fi

  printf '%s' "${_tag#v}"
}

# The Flutter bundle is a self-contained tree (data/, lib/, icudtl.dat) that the
# launcher resolves through its `$ORIGIN/lib` RUNPATH, so it is installed
# verbatim under /usr/lib/crisperweaver and only the launcher is symlinked into
# /usr/bin (glibc derives $ORIGIN from /proc/self/exe, so symlinks are fine).
#
# Known upstream-only packaging blemishes, deliberately not "fixed" here:
#   * no FULL RELRO in the prebuilt ELFs (would need a rebuild from source);
#   * libdartjni.so depends on libjvm.so — the JNI code path is Android-only and
#     unreachable in the Linux build, so no java-runtime dependency is declared.
package() {
  install -d "$pkgdir/usr/lib/crisperweaver"
  cp -a crisper_weaver/. "$pkgdir/usr/lib/crisperweaver/"

  # ── 修掉上游 CI 烧进 ELF 里的 RUNPATH ──────────────────────────────────
  # 注意：这段既不是“检查库在不在”，也不是“补依赖”。依赖的去处只有两个：
  # 包内不带 → 写进 depends（gtk3 / libkeybinder3 …）；包里自带 → 用
  # 这个 lib/ 目录里的那份。这段只是改一个烧在二进制里的搜索路径。
  #
  # 背景：这些 .so 是上游在 GitHub Actions 上编的，DT_RUNPATH 被写死成 CI
  # 的临时目录（/home/runner/.../ephemeral）和 runner 上的 temurin JDK 路径，
  # 在 Arch 上并不存在。
  #   * 功能上一般还能跑：它们要的 libflutter_linux_gtk.so 等已经由主程序
  #     加载过，动态链接器会按 SONAME 命中内存里那份，不会去翻磁盘；
  #   * 但这是个错误配置（namcap 报 Insecure RUNPATH），还会泄露构建路径，
  #     所以统一改成 $ORIGIN（= 这些库自己所在的 lib/ 目录）。
  #
  # 用“扫描”而不是写死文件名，是为了上游以后加/删插件 .so 时不用改这里。
  # 只动“有 RUNPATH 且不等于 $ORIGIN”的文件：本来没有 RUNPATH 的
  # （libapp.so / libglint.so）靠系统路径找库，不需要动；已经是 $ORIGIN 的
  # （libwhisper.so / libflutter_linux_gtk.so）跳过，少改一次少一分风险。
  local so rpath fixed=0
  while IFS= read -r -d '' so; do
    rpath=$(patchelf --print-rpath "$so")
    [[ -n "$rpath" && "$rpath" != '$ORIGIN' ]] || continue
    patchelf --set-rpath '$ORIGIN' "$so"
    printf '    RUNPATH %s -> $ORIGIN: %s\n' "$rpath" "${so#"$pkgdir"}"
    fixed=$(( fixed + 1 ))
  done < <(find "$pkgdir/usr/lib/crisperweaver/lib" -type f -name '*.so*' -print0)
  if (( fixed == 0 )); then
    warning "没有找到需要修的 RUNPATH——上游可能自己修好了，这段可以删掉。"
  fi

  install -d "$pkgdir/usr/bin"

  # ── 启动包装器：把 Flutter 的“文档目录”收进 ~/Documents/crisperweaver ──
  # Flutter 的 path_provider 在 Linux 上靠执行 `xdg-user-dir DOCUMENTS` 得到
  # “应用文档目录”，上游把它当沙箱根目录用，于是 logs/ models/ history/
  # batch/ diagnostics/ 等好几个目录直接铺在用户的 ~/Documents 里。
  # 这行为是 AOT 编译进 libapp.so 的，-bin 包改不了代码，所以只能拦那一次
  # 外部命令调用：给应用一个 PATH 前置的 xdg-user-dir，只改 DOCUMENTS 的
  # 回答（真文档目录 + /crisperweaver 一层，全部收进一个文件夹），其它查询
  # （DOWNLOAD 等）原样转发给真正的 /usr/bin/xdg-user-dir。
  # 注意：上游若哪天改用 getApplicationSupportDirectory，这个 shim 自动失效
  # （不再被查询），不会坏事。
  # 想换成别的位置：CRISPERWEAVER_DOCS_DIR=/path/to/dir crisperweaver
  # 想恢复上游行为：CRISPERWEAVER_DOCS_DIR="$HOME/Documents" crisperweaver
  install -d "$pkgdir/usr/lib/crisperweaver/bin"
  cat >"$pkgdir/usr/lib/crisperweaver/bin/xdg-user-dir" <<'SHIM'
#!/bin/sh
if [ "$1" = DOCUMENTS ]; then
  if [ -n "${CRISPERWEAVER_DOCS_DIR:-}" ]; then
    printf '%s\n' "$CRISPERWEAVER_DOCS_DIR"
  else
    _base=$(/usr/bin/xdg-user-dir DOCUMENTS 2>/dev/null)
    printf '%s\n' "${_base:-$HOME/Documents}/crisperweaver"
  fi
  exit 0
fi
exec /usr/bin/xdg-user-dir "$@"
SHIM
  chmod 0755 "$pkgdir/usr/lib/crisperweaver/bin/xdg-user-dir"

  cat >"$pkgdir/usr/bin/crisperweaver" <<'WRAPPER'
#!/bin/sh
# CrisperWeaver 启动器（见 PKGBUILD 里的说明）。
# CRISPERWEAVER_DOCS_DIR 可以指定数据存放目录，默认 <文档目录>/crisperweaver。
shim=/usr/lib/crisperweaver/bin
case ":$PATH:" in
  *":$shim:"*) ;;
  *) PATH="$shim:$PATH"; export PATH ;;
esac
exec /usr/lib/crisperweaver/crisper_weaver "$@"
WRAPPER
  chmod 0755 "$pkgdir/usr/bin/crisperweaver"
  ln -s crisperweaver "$pkgdir/usr/bin/crisper_weaver"

  install -Dm644 com.crispstrobe.crisperweaver.desktop \
    "$pkgdir/usr/share/applications/com.crispstrobe.crisperweaver.desktop"

  # Upstream only ships a 1024x1024 PNG, which is not one of hicolor's indexed
  # sizes (see /usr/share/icons/hicolor/index.theme), so without resizing the
  # icon would never be found by the XDG/GTK icon lookup.
  local size
  for size in 256 512; do
    install -d "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
    magick com.crispstrobe.crisperweaver.png -resize "${size}x${size}" -strip \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/com.crispstrobe.crisperweaver.png"
  done

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
