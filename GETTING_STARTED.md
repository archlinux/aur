# Getting Started: From Zero to Published AUR Package

This is a step-by-step walkthrough to get this running if I ever stop

## Phase 1: Account Setup

### Step 1.1: Create an AUR Account

Be sure to enter the public key of the computer that will be pushing these changes.

### Step 1.2: Test SSH Connection

```bash
ssh aur@aur.archlinux.org
```

You should see:
```
welcome to the AUR
Connection closed.
```

---

## Phase 2: Push to AUR

### Step 2.1: Add AUR Remote to Your Git

```bash
git remote add aur ssh://aur@aur.archlinux.org/lem-editor.git
```

### Step 2.2: Push Your Package

```bash
git push -u aur main:master
```

### Step 2.3: Verify It Worked

Visit: https://aur.archlinux.org/packages/lem-editor

You should see:
- Your PKGBUILD file
- The .SRCINFO file
- Your commit message

**Done! Your package is now live on AUR.** ✅

---

## Phase 3: Set Up Automation (Optional but Recommended)

After your push succeeds and the package appears on AUR, set up automation:

### Option A: Systemd Timer (Recommended)

```bash
sudo /home/thomas/lem-aur-build/setup-systemd.sh
```

This sets up a daily check at 2 AM. When a new Lem release is found:
1. Package version updates automatically
2. .SRCINFO regenerates
3. Changes push to AUR
4. All logged to systemd journal

Verify it's running:
```bash
systemctl list-timers lem-aur-update.timer
```

---

## Verification Checklist

After Phase 2, verify everything works:

- [ ] SSH key working: `ssh aur@aur.archlinux.org` says "welcome"
- [ ] Git configured: `git config user.name` shows your name
- [ ] AUR remote added: `git remote -v` shows `aur@aur.archlinux.org`
- [ ] Git push succeeded (no errors)
- [ ] Package created: https://aur.archlinux.org/packages/lem-editor exists
- [ ] Files visible: PKGBUILD and .SRCINFO on package page

**If step 2.2 fails:**
Use the web form backup: https://aur.archlinux.org/submit

---

## After Publishing

### Monitoring Your Package

- **AUR Page**: https://aur.archlinux.org/packages/lem-editor
  - Check comments from users
  - Monitor for issues
  
- **Your Git History**: 
  ```bash
  cd /home/thomas/lem-aur-build
  git log --oneline
  ```

- **Logs** (if using systemd):
  ```bash
  sudo journalctl -u lem-aur-update.service -f
  ```

### Testing the Package

On an Arch Linux system:

```bash
git clone https://aur.archlinux.org/lem-editor.git
cd lem-editor
makepkg -si
lem-editor --version
```

### Updating the Package

When a new Lem version is released:

#### Manual Update
```bash
cd /home/thomas/lem-aur-build
./update.sh
```

#### Automatic (with systemd)
The timer runs daily and updates automatically.

---

## Document Index

- **[AUR_SETUP.md](AUR_SETUP.md)** - Detailed AUR SSH and git setup
- **[SYSTEMD_SETUP.md](SYSTEMD_SETUP.md)** - Systemd timer configuration
- **[AUTOMATION.md](AUTOMATION.md)** - All automation options (cron, systemd, etc.)
- **[README.md](README.md)** - Project overview

---

## Quick Command Reference

```bash
# SSH
ssh aur@aur.archlinux.org

# Git
git remote add aur ssh://aur@aur.archlinux.org/lem.git
git push -u aur main:master

# Manual update
./update.sh

# Setup automation
sudo ./setup-systemd.sh

# Check automation status
systemctl list-timers lem-aur-update.timer

# View logs
sudo journalctl -u lem-aur-update.service -f

# Test build locally
./build.sh
```
