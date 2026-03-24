# aws-sso-cli-bin

Arch Linux AUR PKGBUILD for [synfinatic/aws-sso-cli](https://github.com/synfinatic/aws-sso-cli).

## Update to a new upstream version

1. Look up the latest release at https://github.com/synfinatic/aws-sso-cli/releases — find the `aws-sso-<ver>-linux-amd64` and `aws-sso-<ver>-linux-arm64` assets and their SHA-256 digests.
1. Edit `PKGBUILD`:
   - Bump `pkgver`
   - Reset `pkgrel=1` (or increment if same version rebuild)
   - Update both `sha256sums_*`
1. Edit `.gitignore` to match the new binary filename.
1. Regenerate `.SRCINFO`: `makepkg --printsrcinfo > .SRCINFO`
1. Build: `makepkg -sci` (clean + install)
1. Sign commits (`git -S`).
