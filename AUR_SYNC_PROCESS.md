# AUR Package Sync Process

Standard workflow for maintaining AUR packages with dual remotes (personal Gitea + AUR).

---

## Initial Setup (One-time per repository)

### 1. Clone from personal remote (nagini)
```bash
git clone https://src.panahifar.ir/ahp/aur-<package>.git
cd aur-<package>
```

### 2. Configure dual remotes
```bash
# Rename existing origin to nagini
git remote rename origin nagini

# Add AUR remote
git remote add aur ssh://aur@aur.archlinux.org/<package>.git

# Verify
git remote -v
```
**Expected:**
```
aur     ssh://aur@aur.archlinux.org/<package>.git (fetch)
aur     ssh://aur@aur.archlinux.org/<package>.git (push)
nagini  https://src.panahifar.ir/ahp/aur-<package>.git (fetch)
nagini  https://src.panahifar.ir/ahp/aur-<package>.git (push)
```

### 3. Fetch AUR history
```bash
git fetch aur
git branch -r
# Should show: aur/HEAD -> aur/master, aur/master
```

### 4. Initial commit & sync (if new package)
```bash
# Add your PKGBUILD and .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "Add PKGBUILD and .SRCINFO for <package> <version>"

# Merge AUR history (resolve unrelated histories)
git pull aur master --allow-unrelated-histories --no-rebase

# Push to both remotes
git push nagini main
git push aur main:master
```

---

## Daily/Update Workflow

### Pull latest from both remotes
```bash
git fetch nagini
git fetch aur
```

### Make changes to PKGBUILD
```bash
# Edit PKGBUILD (update pkgver, sha256sums, etc.)
vim PKGBUILD

# Regenerate .SRCINFO
makepkg --printsrcinfo > .SRCINFO

# Verify changes
git diff PKGBUILD
git diff .SRCINFO
```

### Commit and push
```bash
git add PKGBUILD .SRCINFO
git commit -m "Update <package> to <version>"

# Push to both remotes
git push nagini main && git push aur main:master
```

---

## Useful Aliases (add to ~/.bashrc or ~/.zshrc)

```bash
# Sync both remotes
alias aur-push='git push nagini main && git push aur main:master'
alias aur-fetch='git fetch nagini && git fetch aur'
alias aur-status='git status && echo "---" && git log --oneline -3'

# Quick update workflow
aur-update() {
    local version=$1
    if [[ -z "$version" ]]; then
        echo "Usage: aur-update <version>"
        return 1
    fi
    # Update pkgver in PKGBUILD (adjust sed for your PKGBUILD format)
    sed -i "s/pkgver=.*/pkgver=$version/" PKGBUILD
    # Update pkgrel=1 for new version
    sed -i "s/pkgrel=.*/pkgrel=1/" PKGBUILD
    makepkg --printsrcinfo > .SRCINFO
    git add PKGBUILD .SRCINFO
    git commit -m "Update to $version"
    aur-push
}
```

---

## Key Points

| Aspect | Detail |
|--------|--------|
| **AUR branch** | Always `master` (not `main`) |
| **Personal branch** | `main` (or your preference) |
| **Push to AUR** | `git push aur main:master` |
| **Merge strategy** | `--allow-unrelated-histories --no-rebase` for first sync |
| **.SRCINFO** | Must be committed; regenerate with `makepkg --printsrcinfo > .SRCINFO` |
| **Force push** | Never needed after initial sync; AUR rejects non-fast-forward |

---

## Troubleshooting

### "non-fast-forward" rejected
```bash
# Pull and merge first
git pull aur master --no-rebase
# Then push
git push aur main:master
```

### "hook declined" on AUR
- AUR server-side hook prevents force pushes
- Always pull/merge before pushing

### Out of sync between remotes
```bash
# Check both
git log --oneline nagini/main
git log --oneline aur/master
# Force sync personal to match AUR (if AUR is source of truth)
git reset --hard aur/master
git push nagini main --force
```

---

## Checklist for New Package

- [ ] Clone from nagini
- [ ] Rename origin → nagini
- [ ] Add aur remote
- [ ] Fetch aur
- [ ] Add PKGBUILD + .SRCINFO
- [ ] Commit
- [ ] Pull aur master (allow unrelated histories)
- [ ] Push to nagini
- [ ] Push to aur
- [ ] Verify on AUR web interface

---

*Template for: `aur-<package>` repositories*