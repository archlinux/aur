# Maintainer: P6g9YHK6 <https://github.com/P6g9YHK6>
pkgname=openpilot-cabana
pkgver=2.0.20261024.gf2f9d5d420
pkgrel=2
epoch=1
pkgdesc="CAN bus visualizer and DBC editor from comma.ai openpilot"
arch=("x86_64")
url="https://github.com/commaai/openpilot/tree/master/openpilot/tools/cabana"
license=("MIT")
depends=(
  "gcc-libs"
  "glibc"
  "libglvnd"
  "libx11"
  "libxcursor"
  "libxi"
  "libxinerama"
  "libxkbcommon"
  "libxrandr"
  "wayland"
)
makedepends=("binutils" "git" "git-lfs" "patchelf" "uv")
optdepends=(
  "kdialog: native file dialogs on KDE"
  "zenity: native file dialogs on GTK desktops"
)
provides=("cabana")
conflicts=("openpilot-cabana-git")
# Vendored FFmpeg and Python extension modules must stay as shipped.
options=("!strip" "!debug" "!lto" "!buildflags")

_commit=f2f9d5d4202def666d6fb446c32605bc6d2b8dd7
_root=/opt/openpilot-cabana
source=("cabana.sh"
        "cabana.desktop"
        "cabana-icon.svg")
sha256sums=('ec2ba662b632be09461383c4880b7cee0a94b0cfa65b838bc3ad775c85753edc'
            'b0c9a0fe8ef337815aad71a5bb66ef8aca40562bdf5622b06c0cf0f2972f61cb'
            'a66f972b8390b67d82e1f15ccce629f54c007c4558060602310b9ac358b9b196')

prepare() {
  # A shallow fetch here avoids the >1 GB full clone a git+ source would need, and
  # skips LFS blobs (models, images) apart from the fonts Cabana loads.
  export GIT_LFS_SKIP_SMUDGE=1
  rm -rf openpilot
  git init -q openpilot
  cd openpilot
  git remote add origin https://github.com/commaai/openpilot.git
  git fetch -q --depth 1 origin "$_commit"
  git checkout -q FETCH_HEAD
  git submodule update --init --depth 1 --recommend-shallow
  unset GIT_LFS_SKIP_SMUDGE
  git lfs install --local
  git lfs pull --include="openpilot/selfdrive/assets/fonts/*"

  # Cabana compiles in absolute asset paths; point them at the install location.
  local sc=openpilot/tools/cabana/SConscript
  sed -i \
    -e "s|env.Dir(\"../../../opendbc_repo/opendbc/dbc\").abspath|\"$_root/opendbc_repo/opendbc/dbc\"|" \
    -e "s|os.path.join(os.path.realpath(BASEDIR), \"openpilot\", \"selfdrive\", \"assets\", \"fonts\")|\"$_root/openpilot/selfdrive/assets/fonts\"|" \
    -e "s|bootstrap_icons.TTF_PATH|\"$_root/.venv/lib/python3.12/site-packages/bootstrap_icons/install/bootstrap-icons.ttf\"|" \
    "$sc"
  [[ $(grep -c "$_root" "$sc") == 3 ]] || { echo "SConscript paths not patched"; return 1; }
}

build() {
  cd openpilot
  export UV_PYTHON_INSTALL_DIR="$srcdir/python" UV_CACHE_DIR="$srcdir/uv-cache" UV_PYTHON_PREFERENCE=only-managed
  uv venv --relocatable .venv
  uv sync --frozen --no-dev --extra tools --link-mode=copy
  source .venv/bin/activate
  # glibc and Python 3.12 headers define _POSIX_C_SOURCE differently; upstream -Werror makes that fatal.
  scons -j"$(nproc)" --cache-disable --ccflags=-Wno-error openpilot/tools/cabana/cabana
}

package() {
  local dest="$pkgdir$_root" py
  install -dm755 "$dest"
  cd openpilot
  tar -c --exclude=.git --exclude=.venv --exclude=tinygrad_repo --exclude=.sconsign.dblite --exclude=scons_cache \
    --exclude="*.o" --exclude="*.os" --exclude="*.a" --exclude="__pycache__" \
    --exclude=openpilot/selfdrive/modeld/models . | tar -x -C "$dest"
  cp -a .venv "$dest/.venv"
  cp -a "$srcdir/python" "$dest/python"
  find "$dest/.venv" "$dest/python" -name __pycache__ -type d -prune -exec rm -rf {} +

  # Remove what Cabana does not use at runtime: repository metadata, tests and C++ sources.
  rm -rf "$dest"/{Jenkinsfile,SConstruct,launch_chffrplus.sh,launch_env.sh,launch_openpilot.sh,.github,.vscode,docs,RELEASES.md,uv.lock,SECURITY.md,alfred.toml,.editorconfig,.lfsconfig,.gitattributes,.gitignore,.gitmodules}
  find "$dest" -path "$dest/.venv" -prune -o -path "$dest/python" -prune -o \
    \( -type d \( -name tests -o -name .github \) \) -prune -exec rm -rf {} +
  find "$dest" -path "$dest/.venv" -prune -o -path "$dest/python" -prune -o -type f \
    \( -name "*.cc" -o -name "*.cpp" -o -name "*.c" -o -name "*.h" -o -name "*.hpp" -o -name "*.pyx" \
       -o -name "*.pxd" -o -name ".gitignore" -o -name ".gitattributes" -o -name "SConscript" \
       -o -name "test_runner" \) -exec rm -f {} +

  # Build-only Python packages, plus editable finders that point into the build directory.
  local site="$dest/.venv/lib/python3.12/site-packages"
  rm -rf "$site"/{gcc_arm_none_eabi,raylib,SCons,Cython,git_lfs,acados,acados_template,casadi,sympy,mpmath,matplotlib,mpl_toolkits,fontTools,eigen,imgui,capnproto,kiwisolver,pyparsing,cycler,contourpy,pyray}
  rm -rf "$site"/{comma_deps_gcc_arm_none_eabi,comma_deps_raylib,comma_deps_git_lfs,comma_deps_acados,comma_deps_eigen,comma_deps_imgui,comma_deps_capnproto,scons,cython,sympy,mpmath,matplotlib,casadi,fonttools,kiwisolver,pyparsing,cycler,contourpy,raylib}-*.dist-info
  rm -f "$site"/__editable__* "$site"/_*_editable*.pth "$site"/*.egg-link
  rm -f "$site"/*.dist-info/direct_url.json
  rm -f "$dest/.venv/bin"/{scons,sconsign,scons-configure-cache,cython,cythonize,cygdb,fonttools,pyftmerge,pyftsubset,ttx,isympy}

  # The bundled interpreter's test suite and GUI toolkit are never used.
  local stdlib="$dest/python/$(basename "$dest"/python/cpython-3.12.*)/lib/python3.12"
  rm -rf "$stdlib"/{test,idlelib,tkinter,turtledemo,turtle.py,ensurepip}
  rm -f "$stdlib"/lib-dynload/_tkinter*
  rm -rf "$stdlib"/config-3.12-*
  rm -rf "$dest/python/$(basename "$dest"/python/cpython-3.12.*)/lib"/{tcl*,tk*,itcl*,thread*}
  rm -f "$dest/python/$(basename "$dest"/python/cpython-3.12.*)/lib"/*.a
  rm -rf "$dest/python/$(basename "$dest"/python/cpython-3.12.*)/include"

  # Make the interpreter and FFmpeg resolve from the install location.
  # uv adds a cpython-3.12-linux-* symlink with a build-time absolute target.
  find "$dest/python" -maxdepth 1 -type l -delete
  py=$(basename "$dest"/python/cpython-3.12.*)
  ln -sf "../../python/$py/bin/python3.12" "$dest/.venv/bin/python"
  sed -i "s|^home = .*|home = $_root/python/$py/bin|" "$dest/.venv/pyvenv.cfg"
  local elf
  while read -r elf; do
    case "$(patchelf --print-rpath "$elf" 2>/dev/null)" in
      *"$srcdir"*) patchelf --set-rpath "$_root/.venv/lib/python3.12/site-packages/ffmpeg/install/lib" "$elf" ;;
    esac
  done < <(find "$dest" -path "$dest/.venv" -prune -o -path "$dest/python" -prune -o -type f -executable -print)

  # Debug info accounts for most of the binary and embeds build-directory paths.
  strip --strip-debug "$dest/openpilot/tools/cabana/cabana"

  install -Dm755 "$srcdir/cabana.sh" "$pkgdir/usr/bin/cabana"
  install -Dm644 "$srcdir/cabana.desktop" "$pkgdir/usr/share/applications/cabana.desktop"
  install -Dm644 "$srcdir/cabana-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/cabana.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
