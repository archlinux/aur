# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Francesco La Camera <fm@lacamera.org>
pkgname=neovim-nightly
pkgver=0.10.0.dev.20230525
pkgrel=3
pkgdesc='hyperextensible Vim-based text editor'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64' 'pentium4')
url='https://github.com/neovim/neovim/releases/tag/nightly'
backup=('etc/xdg/nvim/sysinit.vim')
license=('custom:neovim')
depends=('libluv' 'libtermkey' 'libuv' 'libvterm' 'luajit' 'msgpack-c' 'tree-sitter' 'unibilium' 'lua51-lpeg' 'lua51-mpack')
makedepends=('cmake' 'gperf' 'ninja' 'patchelf')
optdepends=('python2-neovim: Python 2 provider'
            'python-pynvim: Python 3 provider'
            'ruby-neovim: Ruby provider'
            'xclip: X11 clipboard integration'
            'xsel: X11 clipboard integration'
            'wl-clipboard: wayland clipboard integration')

# get latest version
_neovim_version() {
  if [ -e "$srcdir/neovim-nightly/CMakeLists.txt" ] ; then
    _regex_vmaj='^set\(NVIM_VERSION_MAJOR ([0-9]+)\)$'
    _regex_vmin='^set\(NVIM_VERSION_MINOR ([0-9]+)\)$'
    _regex_vpat='^set\(NVIM_VERSION_PATCH ([0-9]+)\)$'

    _neovim_version_major=$(
      grep -E "$_regex_vmaj" "$srcdir/neovim-nightly/CMakeLists.txt" \
        | sed -E "s@$_regex_vmaj@\1@"
    )
    _neovim_version_minor=$(
      grep -E "$_regex_vmin" "$srcdir/neovim-nightly/CMakeLists.txt" \
        | sed -E "s@$_regex_vmin@\1@"
    )
    _neovim_version_patch=$(
      grep -E "$_regex_vpat" "$srcdir/neovim-nightly/CMakeLists.txt" \
        | sed -E "s@$_regex_vpat@\1@"
    )
  else
    _neovim_version_major=0
    _neovim_version_minor=10
    _neovim_version_patch=0
  fi

  printf "%s.%s.%s" \
    "$_neovim_version_major" \
    "$_neovim_version_minor" \
    "$_neovim_version_patch"
}

_pkgver() {
  _response=$(
    curl 'https://api.github.com/repos/neovim/neovim/releases?per_page=1&page=1' -s \
      | grep -E -A 6 '^\s+"tag_name": "nightly".*$'
  )

  _regex_date='^\s+"created_at": "([0-9]+-[0-9]+-[0-9]+)T.*".*$'
  _date=$(
    echo "$_response" \
      | grep -E "$_regex_date" \
      | sed -E "s@$_regex_date@\1@; s@-@@g"
    )

  _regex_commit='^\s+"target_commitish": "([^"]+)".*$'
  _commit=$(
    echo "$_response" \
      | grep -E "$_regex_commit" \
      | sed -E "s@$_regex_commit@\1@"
  )

  _neovim_version=$(_neovim_version)

  printf '%s.dev.%s.g%s' \
    "$_neovim_version" \
    "$_date" \
    "${_commit:0:7}"
}
_pkgver=$(_pkgver)
source=("$pkgname-$_pkgver::https://github.com/neovim/neovim/archive/refs/tags/nightly.tar.gz")
provides=("neovim=$_pkgver" 'vim-plugin-runtime')
conflicts=('neovim')
sha256sums=('SKIP')

pkgver() {
	printf "$_pkgver"
}

build() {
  cmake -Sneovim-nightly -Bbuild \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  cd "$srcdir/build"
  ./bin/nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
  cd "$srcdir/build"
  DESTDIR="$pkgdir" cmake --build . --target install
  cd "$srcdir/neovim-nightly"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 runtime/nvim.desktop "$pkgdir/usr/share/applications/nvim.desktop"
  install -Dm644 runtime/nvim.png "$pkgdir/usr/share/pixmaps/nvim.png"
  mkdir -p "$pkgdir/etc/xdg/nvim"
  mkdir -p "$pkgdir/usr/share/nvim"
  echo "source /usr/share/nvim/archlinux.vim" >> "$pkgdir"/etc/xdg/nvim/sysinit.vim
  echo "set runtimepath+=/usr/share/vim/vimfiles" > "$pkgdir"/usr/share/nvim/archlinux.vim
}
