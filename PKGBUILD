# shellcheck shell=bash disable=2034,2154,2148

# Maintainer: Cody Lee Cochran <cody.l.cochran@gmail.com>

# Notes from the maintainer team:
#
# Minecraft Bedrock clients available for Windows, XBox and other consoles will typically update
# before this package does. If your client begins reporting an out of date Minecraft Bedrock Server,
# find the new version and hashsum of the source zip file, and submit a patch and/or comment to the
# AUR page for this package:
# https://aur.archlinux.org/packages/minecraft-bedrock-server
# A maintainer will update the package shortly with the new hash and version.

# Name of the package, as displayed on the AUR.
pkgname=minecraft-bedrock-server

# Description of the package, as it will be displayed on the AUR.
pkgdesc="Minecraft Bedrock Server compatible with Windows and XBox Minecraft clients"

# URL for the download page or home page of the upstream vendor's package, as displayed on the AUR.
url="https://www.minecraft.net/en-us/download/server/bedrock"

# This package version number can be found on the official Minecraft Bedrock server download page.
# https://www.minecraft.net/en-us/download/server/bedrock
# Mouseover the "DOWNLOAD" button under the section for the stable/non-preview "Ubuntu (Linux)" version.
pkgver=1.21.121.1

# This sha256 hashsum can be determined by manually downloading the file from the official download page.
# https://www.minecraft.net/en-us/download/server/bedrock
# Click the "DOWNLOAD" button under the section for the stable/non-preview "Ubuntu (Linux)" version.
# To get the sha256 hashsum, run the following on the downloaded file:
# sha256sum <bedrock-server-vX.YY.Z>.zip
_pkghash='97789e2c8c9b029d2164475c61edd10c49c9bb7edca3fb14434eed78c9ba3c15'

# Version of the AUR package, (not the underlying vendor's release version).
# This is only higher than "1" if another AUR package release is cut
# for the same "pkgver" of the upstream vendor's package.
pkgrel=1

# The license type of the upstream vendor's package, as displayed on the AUR.
license=(
  'custom'
)

# Instructs makepkg not to extract a source code archive automatically
# when installing the package via makepkg or the user's AUR helper (i.e. paru, yay, etc).
# For this package, we do this ourselves (in a custom way) in the build() function (defined below).
#shellcheck disable=2016
noextract=(
  'bedrock-server-${pkgver}.zip'
)

# Instructs makepkg not to override these files when installing patches/updates to
# an older version of this same package.
#   server.properties - Contains server configs
#   permissions.json - Used for server role-based access controls (RBAC)
#   allowlist.json - Used for explictly allowing only certain users to have access to the server
#   whitelist.json - The old name for 'allowlist.json' as of server v1.18.10; migrate to 'allowlist.json'
backup=(
  opt/minecraft-bedrock-server/{server.properties,permissions.json,whitelist.json,allowlist.json}
)

# CPU Architecture that this AUR package is designed to run on.
arch=(
  'x86_64'
)

# Dependencies required for makepkg to install this package.
# These dependencies are not required after install is completed.
# These dependencies are displayed on the AUR package page.
makedepends=(
  'unzip'
)

# The first file in this sources list is located on the official Minecraft Bedrock Server download page.
# https://www.minecraft.net/en-us/download/server/bedrock
# Mousing over the download button for the stable/non-preview "Ubuntu (Linux)" version will provide the full URL.
source=(
  "https://minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-${pkgver}.zip"
  'minecraft-bedrock-server.service'
  'minecraft-bedrock-server.sysusers'
  'minecraft-bedrock-server.tmpfiles'
)

# These are the matching hashsums for the files listed in the 'source' array elsewhere in this file.
# They are indexed (i.e. 0,1,2,3) in the same manner as the source array, and must match its same order.
# So, for example, the second hash in this array must be the hash for the second filename in the sources array.
# The hash for the source zip file is set with the '_pkghash' variable because it changes with each new release.
# The other hashsums are hardcoded because the systemd files in this repo rarely change as new releases are cut.
sha256sums=(
  "${_pkghash}"
  'cc08effe04701f1ca16a1edd153d12a94ed498e9a3e68a004b74189eef9edb81'
  'a7070301958b58f804bb8dee8b66ef23ad7460403f7ba2cfffb549e29ad834d5'
  '829ff9e583408fcc1d0436a6896ecbd3128f893dcbc2b0147130219a13586ae3'
)

# Without the appropriate user-agent string,
# the automated download of the source zip will hang and eventually timeout.
# If this happens, please help by figuring out the appropriate one and submit a patch to this array value.
# The upstream package maintainer has put protections in place
# to discourage automated downloads by certain bots/scripts.
# More information about why this is sometimes needed can be found here on the Arch wiki:
# https://wiki.archlinux.org/title/Nonfree_applications_package_guidelines#Custom_DLAGENTS
DLAGENTS=(
  "https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u"
)

# This function is called by makepkg as a pre-requisite step to installing the package.
# Prior to this function running, makepkg will automatically download any remote source files listed
# in the "sources" array (elsewhere in this file), and will check their hashes against those listed
# in the "sha256sums" array. The hash for the source zip, in particular, is stored in the '_pkghash' var.
build() {
  unzip -q bedrock-server-"${pkgver}".zip -d tmp &&
    rm bedrock-server-"${pkgver}".zip
}

# This function is called by makepkg to perform the install of the source zip,
# and runs after the source zip is downloaded automatically,
# and after the build() function has already run successfully.
# It is not coded directly in this function, but any files in the 'backup' array are automatically backed up
# and then moved back into place after this function completes. This is done in order to preserve post-install
# user configurations from any previous installs of this same package on the same system.
package() {
  install -d "${pkgdir}"/opt/minecraft-bedrock-server &&
    cp -r -fHip "${srcdir}"/tmp/* "${pkgdir}/opt/minecraft-bedrock-server" &&
    install \
      -Dm 644 minecraft-bedrock-server.service \
      -t "${pkgdir}"/usr/lib/systemd/system/ &&
    install \
      -Dm 644 minecraft-bedrock-server.sysusers \
      "${pkgdir}"/usr/lib/sysusers.d/minecraft-bedrock-server.conf &&
    install \
      -Dm 644 minecraft-bedrock-server.tmpfiles \
      "${pkgdir}"/usr/lib/tmpfiles.d/minecraft-bedrock-server.conf
}
