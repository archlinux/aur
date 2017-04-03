# Maintainer: Max Liebkies <mail at maxliebkies dot de>

pkgname=vscode-coreclr-debug
pkgver=1.9.1
pkgrel=1
pkgdesc="CoreCLR debugger for the Omnisharp Visual Studio Code extension. After installation symlink /opt/dotnet/debugger as ~/.vscode/extensions/ms-vscode.csharp-?.?.?/.debugger"
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
depends=('dotnet=1.1.1')
options=(staticlibs)

source=(
  "https://vsdebugger.blob.core.windows.net/coreclr-debug-1-9-1/coreclr-debug-ubuntu.16.10-x64.zip"
)

sha256sums=('b01862cc62fbf21eedc0160c84a1135b5069e2f735354f98c5baf68c4f608884')

_coreclr_files=(
  'libclrjit.so'
  'libcoreclr.so'
  'libcoreclrtraceptprovider.so'
  'libdbgshim.so'
  'libmscordaccore.so'
  'libmscordbi.so'
  'libsosplugin.so'
  'libsos.so'
  'System.Globalization.Native.so'
)

_corefx_files=(
  'System.IO.Compression.Native.so'
  'System.Native.so'
  'System.Native.a'
  'System.Net.Http.Native.so'
  'System.Net.Security.Native.so'
  'System.Security.Cryptography.Native.so'
  'System.Security.Cryptography.Native.OpenSsl.so'
)

package() {
  mkdir -p "${pkgdir}/opt/dotnet/"
  
  # copy the original files from the binary archive
    cp --force --preserve=mode --recursive "${srcdir}" "${pkgdir}/opt/dotnet/debugger"

  for file in "${_coreclr_files[@]}"; do
    ln --force --symbolic "/opt/dotnet/shared/Microsoft.NETCore.App/1.1.1/${file}" "${pkgdir}/opt/dotnet/debugger/"
  done

  for file in "${_corefx_files[@]}"; do
    ln --force --symbolic "/opt/dotnet/shared/Microsoft.NETCore.App/1.1.1/${file}" "${pkgdir}/opt/dotnet/debugger/"
  done

  chown -R root:root "${pkgdir}/opt/dotnet/debugger"
  chmod 755 "${pkgdir}/opt/dotnet/debugger/vsdbg"
  chmod 755 "${pkgdir}/opt/dotnet/debugger/vsdbg-ui"
}

# vim:set ts=2 sw=2 et:
