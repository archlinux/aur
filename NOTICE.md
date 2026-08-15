# NOTICE

This AUR package (`rclone-wiz`) is built **directly from the source repository** on GitHub:

> https://github.com/themix88/Clone-WIZ.git (branch: `master`)

There are no local source files in this AUR package. All application files
(Python script, desktop entry, icon, license, etc.) are fetched automatically
from the GitHub repository at build time by `makepkg`.

## Repository contents

| File | Purpose |
|------|---------|
| `PKGBUILD` | Build instructions for makepkg |
| `.SRCINFO` | AUR metadata (auto-generated from PKGBUILD) |
| `NOTICE.md` | This file |

## Building

```bash
# Clone the AUR package repo
git clone https://aur.archlinux.org/rclone-wiz.git
cd rclone-wiz

# Build and install (makepkg will clone the source from GitHub)
makepkg -si
```

Or simply install via an AUR helper:

```bash
paru -S rclone-wiz
# or
yay -S rclone-wiz
```
