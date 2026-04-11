# Automated Update and Publish Workflow

This guide sets up automated updates to the Lem AUR package using Claude Code's scheduling system.

## Quick Start

Once you have:
1. ✅ AUR account set up
2. ✅ SSH key added to AUR (see AUR_SETUP.md)
3. ✅ AUR remote configured: `git remote add aur ssh://aur@aur.archlinux.org/lem.git`
4. ✅ Git identity configured: `git config user.name` and `git config user.email`

You can use Claude Code's scheduler to automate updates:

```bash
/schedule update.sh
```

## Manual Update

To manually run an update:

```bash
cd /home/thomas/lem-aur-build
./update.sh
```

This script will:
1. Fetch the latest Lem release
2. Increment the `pkgrel` version
3. Generate `.SRCINFO` using Docker
4. Commit changes to git
5. Push to AUR

## What the Update Script Does

The `update.sh` script:

1. **Checks prerequisites**
   - Required tools: git, curl, docker
   - Git user configuration
   - Valid git repository

2. **Fetches latest release**
   - Queries GitHub API for latest Lem release with assets
   - Uses nightly builds since stable releases don't have precompiled binaries

3. **Updates PKGBUILD**
   - Increments `pkgrel` to signal a new package version
   - Leaves `pkgver` stable (using nightly release date)

4. **Generates .SRCINFO**
   - Runs `makepkg --printsrcinfo` in Docker (no makepkg on Debian)
   - Creates AUR-required metadata file

5. **Commits and pushes**
   - Stages PKGBUILD and .SRCINFO
   - Creates a git commit with descriptive message
   - Pushes to AUR repository

## Scheduling Options

### Option 1: Claude Code Scheduler (Easiest)

```bash
/schedule update.sh
```

Follow the prompts to set:
- Schedule interval (e.g., daily, weekly)
- Start time
- Timezone

This uses Claude's built-in scheduling and will run `update.sh` automatically.

### Option 2: Linux Cron

Add to your crontab:

```bash
crontab -e
```

Example: Update daily at 2 AM UTC:
```
0 2 * * * cd /home/thomas/lem-aur-build && ./update.sh >> /tmp/lem-aur-update.log 2>&1
```

Example: Update weekly (Sundays at 3 AM):
```
0 3 * * 0 cd /home/thomas/lem-aur-build && ./update.sh >> /tmp/lem-aur-update.log 2>&1
```

### Option 3: SystemD Timer (Advanced)

Create `/etc/systemd/system/lem-aur-update.timer`:

```ini
[Unit]
Description=Update Lem AUR Package
Requires=lem-aur-update.service

[Timer]
# Run daily at 2 AM
OnCalendar=daily
OnCalendar=02:00

[Install]
WantedBy=timers.target
```

Create `/etc/systemd/system/lem-aur-update.service`:

```ini
[Unit]
Description=Lem AUR Package Update Service

[Service]
Type=oneshot
WorkingDirectory=/home/thomas/lem-aur-build
ExecStart=/home/thomas/lem-aur-build/update.sh
User=thomas
StandardOutput=journal
StandardError=journal
```

Enable and start:
```bash
sudo systemctl daemon-reload
sudo systemctl enable lem-aur-update.timer
sudo systemctl start lem-aur-update.timer
```

Check status:
```bash
sudo systemctl status lem-aur-update.timer
sudo journalctl -u lem-aur-update.service -f
```

## Monitoring Updates

### Check Logs

After running updates manually or automatically, check:
- Cron logs: `grep lem-aur /var/log/syslog`
- Custom log file: `tail /tmp/lem-aur-update.log`
- Git commits: `git log --oneline | head -10`

### AUR Package Page

Monitor your package on AUR:
- https://aur.archlinux.org/packages/lem
- Check for user comments
- Review Git commit history

### Test the Package

To verify the published package works:

```bash
# On an Arch system
git clone https://aur.archlinux.org/lem.git
cd lem
makepkg -si
lem --version
```

## Troubleshooting Automated Updates

### Updates Not Running

**Check cron job:**
```bash
crontab -l
```

**Check cron logs:**
```bash
sudo journalctl -u cron -f
# or
grep CRON /var/log/syslog | tail -20
```

**Test the script manually:**
```bash
cd /home/thomas/lem-aur-build
bash -x ./update.sh
```

### Docker Issues

**Docker daemon not running:**
```bash
sudo systemctl start docker
# or
sudo service docker start
```

**Verify Docker works:**
```bash
docker ps
docker run hello-world
```

### Git/AUR Push Failures

**Check AUR remote:**
```bash
git remote -v
```

**Test SSH connection:**
```bash
ssh aur@aur.archlinux.org
```

**Manual push:**
```bash
cd /home/thomas/lem-aur-build
git push aur main:master -v
```

### .SRCINFO Generation Failures

**Test makepkg in Docker:**
```bash
docker run --rm -v $(pwd):/build lem-aur-builder -c "cd /build && makepkg --printsrcinfo"
```

**Rebuild Docker image:**
```bash
docker build -t lem-aur-builder --no-cache .
```

## Best Practices

1. **Test first** - Run `./update.sh` manually first time
2. **Monitor logs** - Keep an eye on automation logs initially
3. **Git history** - Regularly review git commits to ensure quality
4. **AUR feedback** - Check your AUR package page for user issues
5. **Stable schedule** - Update weekly or monthly, not too frequently
6. **Backup SSH key** - Keep your AUR SSH key safe and backed up

## Advanced: Custom Update Logic

To modify update behavior, edit `update.sh`:

- Change release selection: Edit `get_latest_release()`
- Customize commit messages: Edit `commit_changes()`
- Add pre/post-update hooks: Add functions to `main()`

For example, to always use a specific release instead of nightly:

```bash
get_latest_release() {
    # Use v2.3.0 instead of nightly
    echo "v2.3.0"
}
```

## References

- Cron tutorial: https://crontab.guru/
- SystemD timers: https://www.freedesktop.org/software/systemd/man/systemd.timer.html
- AUR Maintainer Guide: https://wiki.archlinux.org/title/AUR_maintainers
