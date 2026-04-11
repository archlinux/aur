# Getting Started: From Zero to Published AUR Package

This is a step-by-step walkthrough to get your Lem package live on AUR.

**Total time: ~10 minutes**

## Phase 1: SSH Setup (5 minutes)

### Step 1.1: Generate SSH Key

```bash
ssh-keygen -t ed25519 -C "thomas.ramfjord@gmail.com"
```

Press Enter to use default location (`~/.ssh/id_ed25519`). Don't use a passphrase for automation to work without prompts.

### Step 1.2: Copy Your Public Key

```bash
cat ~/.ssh/id_ed25519.pub
```

Copy the entire output (starts with `ssh-ed25519`).

### Step 1.3: Add Key to AUR

1. Visit https://aur.archlinux.org and log in
2. Click on your username → Account
3. Find "SSH Public Key"
4. Paste your public key (from Step 1.2)
5. Save

### Step 1.4: Test SSH Connection

```bash
ssh aur@aur.archlinux.org
```

You should see:
```
welcome to the AUR
Connection closed.
```

**If this fails:** See AUR_SETUP.md for troubleshooting.

---

## Phase 2: Git Configuration (2 minutes)

Your git is already configured:
```
User: Thomas Ramfjord
Email: thomas.ramfjord@gmail.com
```

If you want to change it:
```bash
cd /home/thomas/lem-aur-build
git config user.name "Your Name"
git config user.email "your@email.com"
```

---

## Phase 3: Push to AUR (2 minutes)

The AUR creates packages automatically on first git push. No web form needed.

### Step 3.1: Add AUR Remote to Your Git

```bash
cd /home/thomas/lem-aur-build
git remote add aur ssh://aur@aur.archlinux.org/lem.git
```

### Step 3.2: Push Your Package

```bash
cd /home/thomas/lem-aur-build
git push -u aur main:master
```

**Important:** AUR uses `master` branch, not `main`. Your package will be automatically created.

### Step 3.3: Verify It Worked

Visit: https://aur.archlinux.org/packages/lem

You should see:
- Your PKGBUILD file
- The .SRCINFO file
- Your commit message

**Done! Your package is now live on AUR.** ✅

---

## Phase 4: Set Up Automation (Optional but Recommended)

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

### Option B: Cron Job

```bash
crontab -e
```

Add this line (update daily at 2 AM):
```
0 2 * * * cd /home/thomas/lem-aur-build && ./update.sh >> /tmp/lem-aur-update.log 2>&1
```

### Option C: Manual Updates (No Automation)

Run this whenever you want to check for and publish updates:

```bash
cd /home/thomas/lem-aur-build
./update.sh
```

---

## Verification Checklist

After Phase 3, verify everything works:

- [ ] SSH key working: `ssh aur@aur.archlinux.org` says "welcome"
- [ ] Git configured: `git config user.name` shows your name
- [ ] AUR remote added: `git remote -v` shows `aur@aur.archlinux.org`
- [ ] Git push succeeded (no errors)
- [ ] Package created: https://aur.archlinux.org/packages/lem exists
- [ ] Files visible: PKGBUILD and .SRCINFO on package page

**If step 3.2 fails:**
Use the web form backup: https://aur.archlinux.org/submit

---

## After Publishing

### Monitoring Your Package

- **AUR Page**: https://aur.archlinux.org/packages/lem
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
git clone https://aur.archlinux.org/lem.git
cd lem
makepkg -si
lem --version
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

## Troubleshooting

### SSH Connection Fails

```bash
# Test with verbose output
ssh -vvv aur@aur.archlinux.org

# Common issues:
# - SSH key not in AUR account
# - Wrong key permissions
# - Firewall blocking port 22
```

See AUR_SETUP.md for detailed troubleshooting.

### Git Push Fails

```bash
# Verify remote
git remote -v

# Try manual push with verbose output
git push -u aur main:master -v

# Common issues:
# - AUR remote not configured
# - SSH key not authorized
# - Package not created on AUR website
```

### Automation Not Working

#### Systemd Timer Issues
```bash
# Check timer status
sudo systemctl status lem-aur-update.timer

# View logs
sudo journalctl -u lem-aur-update.service -f

# Run manually to test
sudo systemctl start lem-aur-update.service
```

#### Cron Job Issues
```bash
# Check if cron is running
sudo service cron status

# View cron logs
grep CRON /var/log/syslog | tail -10

# Test the command manually
/home/thomas/lem-aur-build/update.sh
```

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

---

**You're all set!** Your Lem AUR package is live and ready for the community. 🎉
