# AGENTS.md

## PKGBUILD

### Shell Completions

Shell completion files are in the root directory (`_qodercli`, `qodercli.bash`, `qodercli.fish`) and installed using `$startdir`:

```bash
install -Dm644 "$startdir/_qodercli" \
  "$pkgdir/usr/share/zsh/site-functions/_qodercli"
```

They are NOT added to the `source` array because makepkg only looks for files by basename in the build directory.

### sha256sums

`sha256sums` only contains LICENSE. Completion files are not included since they're installed directly from `$startdir`:

```bash
sha256sums=('LICENSE-checksum')
```

