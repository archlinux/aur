# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=powershell-mmi-bin
_nugetid=Microsoft.Management.Infrastructure.Runtime.Unix
pkgver=3.0.0
pkgrel=1
pkgdesc="Microsoft.Management.Infrastructure (MMI) for PowerShell, Microsoft's build"
arch=('any')
url='https://www.nuget.org/packages/Microsoft.Management.Infrastructure.Runtime.Unix'
# The license the NuGet package declares. Its sources aren't published: the repository it links to has
# the code of version 2.0.0-preview.1 (powershell-mmi), whose API the assembly has, and its SBOM makes
# no assertion about the license.
license=('MIT')
depends=(
  powershell
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
# PowerShell is built without MMI. It's only needed by modules built against PowerShell with it, e.g.
# PSScriptAnalyzer from the PowerShell Gallery. The package has no license text, MIT needs one, so it's
# taken from the repository the package links to.
_mmicommit="cf32fc695b32c2eae848b693395c09222fe1d2ae"
source=("$_nugetid.$pkgver.nupkg::https://api.nuget.org/v3-flatcontainer/${_nugetid,,}/$pkgver/${_nugetid,,}.$pkgver.nupkg"
  "LICENSE-$_mmicommit::https://raw.githubusercontent.com/PowerShell/MMI/$_mmicommit/LICENSE")
noextract=("$_nugetid.$pkgver.nupkg")
sha512sums=('d8ae69c763aa128703ff2a159ff804fab46e22a4088759fc7017e1deda1227703caa72003dd20d2528b97b84f975e655e68a7afbe6100d9d63ee3490272580b7'
            '7e1ffcc72def4f29168cc76548669481d96a75efb72f1fc11031261cf2981baee101b33016e12645f39c46ca1df1459eceb36d0175c4fc9508133ac6794c78d7')
b2sums=('bf6f4bd7d51ebbf0cce6ef4ea8bc0a3a5f84ab3a98fa2cff1c86ae70dc60bdcba2dd6398c163d02524a1e9ef226b05c41e2f515f57c583bdb44be53ceeb6f6c6'
        '4a1ade89d01202c542792e88640f2e2cf73f010b7f735113cfd4e21958c9cf75c5bd6160f07c3458e3b54fc40a5473567b0c965937add36ce97b07a6df1c57f3')

package() {
  local _pshome=/usr/lib/powershell-7
  install -dm755 "$pkgdir$_pshome"
  bsdtar -xOf "$_nugetid.$pkgver.nupkg" runtimes/unix/lib/netstandard1.6/Microsoft.Management.Infrastructure.dll \
    >"$pkgdir$_pshome/Microsoft.Management.Infrastructure.dll"
  chmod 644 "$pkgdir$_pshome/Microsoft.Management.Infrastructure.dll"
  # Added to pwsh.deps.json by the powershell-deps hook of powershell, the .NET host only loads the
  # assemblies it lists
  install -dm755 "$pkgdir/usr/share/powershell/deps.d"
  cat >"$pkgdir/usr/share/powershell/deps.d/microsoft-management-infrastructure.json" <<EOF
{
  "targets": {
    ".NETCoreApp,Version=v10.0": {
      "$_nugetid/$pkgver": {
        "runtime": {
          "Microsoft.Management.Infrastructure.dll": {
            "assemblyVersion": "2.0.0.0",
            "fileVersion": "2.0.0.0"
          }
        }
      }
    }
  },
  "libraries": {
    "$_nugetid/$pkgver": {
      "type": "package",
      "serviceable": false,
      "sha512": ""
    }
  }
}
EOF
  install -Dm644 "LICENSE-$_mmicommit" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
