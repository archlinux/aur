# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=sourcemod-sourcebans-pp-discord-forward
_name=discord-forward
# The latest commit, versioned like git describe from the last tag (2018): it compiles with current
# SourceMod and has the fixes since, plugin version 1.2.0
_commit=736764a6abddff6b39fd43c45752b34c7db30be0
pkgver=1.1.0.r10.g736764a
pkgrel=1
pkgdesc="SourceBans++ Discord Forward, a SourceMod plugin forwarding bans, comms blocks and reports to Discord webhooks"
arch=(any)
url="https://github.com/sbpp/discord-forward"
license=(GPL-3.0-only)
# The plugins and extensions it uses, whose include files it's compiled with
depends=(sourcemod sourcemod-smjansson sourcemod-sourcebans-pp sourcemod-steamworks)
makedepends=(sourcemod-scripting)
# Where ./aur-packages commits reads the pins from: the commit pkgver names
_pins_lookup() {
  echo "_commit $(curl -fsSL "https://api.github.com/repos/sbpp/discord-forward/commits/${pkgver##*.g}" | jq -r .sha)"
}
source=("$_name-$_commit.tar.gz::https://github.com/sbpp/discord-forward/archive/$_commit.tar.gz")
sha512sums=('3faa4e13e99c8168a8040bc46f0712406f60464f517849d378f46bb9404a4e785a2885467365de61e91070ee231cc8a9bc1fef490a03617c3c3b728f46656f97')
b2sums=('d209413904e8701a74bba38bb281217298834c929c851f6667d822f350ce0e777cefc8f345cc64bfcb40e022a1eb5a92a1c78da06bcf8de33d5f04132e649c1c')

build() {
  # With the include files of SourceMod, SteamWorks, SMJansson and SourceBans++, which spcomp finds
  # in SourceMod's scripting folder
  cd "$_name-$_commit" || exit
  spcomp64 -osbpp_discord.smx sbpp_discord.sp
}

package() {
  # In the addons folder of sourcemod
  install -Dm644 "$_name-$_commit/sbpp_discord.smx" -t "$pkgdir/usr/lib/sourcemod/addons/sourcemod/plugins"
}
