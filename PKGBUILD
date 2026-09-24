# Maintainer: Tomáš Karela Procházka <tomas.prochazka5d@gmail.com>

pkgname=signageos-cli
_npmname=@signageos/cli
_cmd=sos
pkgver=4.4.0
pkgrel=2
pkgdesc='signageOS command-line interface for developing applets and managing devices'
arch=('any')
url='https://github.com/signageos/cli'
license=('MIT')
depends=('nodejs>=20')
makedepends=('npm')
# AUR `sos` (sosreport) also installs /usr/bin/sos.
conflicts=('sos')
options=(!strip !debug)

source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_npmname/-/${_npmname#*/}-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('fcc4d7f7e107d01daaea4a84ed6b73fbaeb9c9e5a00bf83428d939f8e94eb38f')

package() {
  # The only install scripts in the tree are no-ops on Linux: the CLI's own
  # postinstall requires a postinstall.js that is not in the tarball, and
  # @signageos/file's has only a win32 variant. npm 12 blocks both anyway.
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    --ignore-scripts \
    --no-audit --no-fund \
    "$srcdir/$pkgname-$pkgver.tgz"

  # npm leaves group-writable directories behind.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # tar-stream (via archiver) depends on bare-fs, which drags in bare-path and
  # bare-url. Node never loads them: tar-stream maps them only under the `bare`
  # import condition, and their bindings use require.addon(), which exists only
  # in the Bare runtime. Their Linux and Android prebuilds would otherwise be
  # the only ELF files in an arch=any package.
  rm -r "$pkgdir"/usr/lib/node_modules/$_npmname/node_modules/bare-*/prebuilds

  # The generator replaces a placeholder it matches with four leading spaces,
  # but the shipped template indents it with tabs, so the per-subcommand case
  # arms are never inserted and `sos applet <TAB>` offers top-level commands.
  # Fix the installed template, which also repairs `sos autocomplete install`.
  local _tpl="$pkgdir/usr/lib/node_modules/$_npmname/dist/Command/Autocomplete/Install/sos-completion.sh"
  grep -q $'^\t\t# COMMAND_SCHEMA_CASES' "$_tpl"
  sed -i $'s/^\t\t# COMMAND_SCHEMA_CASES/    # COMMAND_SCHEMA_CASES/' "$_tpl"

  # The completion script is generated from the command tree at runtime and
  # written to $HOME/.sos-completion.sh (plus a source line appended to the
  # shell rc), so run the installed CLI against a throwaway HOME and keep only
  # the script.
  local _home="$srcdir/home"
  rm -rf "$_home"
  mkdir -p "$_home"
  HOME="$_home" SHELL=/bin/bash "$pkgdir/usr/bin/$_cmd" autocomplete install >/dev/null
  install -Dm644 "$_home/.sos-completion.sh" \
    "$pkgdir/usr/share/bash-completion/completions/$_cmd"

  # There is no zsh generator: upstream's zsh support is sourcing the bash
  # script from ~/.zshrc, which works only if bashcompinit ran first. Ship an
  # autoloaded wrapper instead. Sourcing re-registers `sos` through
  # bashcompinit's `complete`, so the last line runs that handler for the TAB
  # that loaded the wrapper; without it the first completion offers nothing.
  install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_cmd" <<EOF
#compdef $_cmd
autoload -Uz bashcompinit && bashcompinit
source /usr/share/bash-completion/completions/$_cmd
\${=_comps[$_cmd]}
EOF
}

# vim:set ts=2 sw=2 et:
